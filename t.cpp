#include <iostream>
using namespace std;

class TrieNode {
public:
    TrieNode* children[26];
    bool isEndOfWord;
    char data;

    TrieNode(char ch) {
        data = ch;
        isEndOfWord = false;
        for (int i = 0; i < 26; i++)
            children[i] = nullptr;
    }
};

class Trie {
private:
    TrieNode* root;

    bool hasChildren(TrieNode* node) {
        for (int i = 0; i < 26; i++)
            if (node->children[i])
                return true;
        return false;
    }

    bool deleteHelper(TrieNode* node, string word, int depth) {
        if (!node)
            return false;

        if (depth == word.length()) {
            if (!node->isEndOfWord)
                return false;

            node->isEndOfWord = false;
            return !hasChildren(node);
        }

        int index = word[depth] - 'a';

        if (deleteHelper(node->children[index], word, depth + 1)) {
            delete node->children[index];
            node->children[index] = nullptr;
            return !node->isEndOfWord && !hasChildren(node);
        }
        return false;
    }

    void autocompleteHelper(TrieNode* node, string prefix) {
        if (!node) return;

        if (node->isEndOfWord)
            cout << prefix << endl;

        for (int i = 0; i < 26; i++) {
            if (node->children[i]) {
                autocompleteHelper(node->children[i], prefix + char('a' + i));
            }
        }
    }

    void displayTreeHelper(TrieNode* node, string prefix, bool isLast) {
        if (!node) return;

        cout << prefix;
        if (isLast) {
            cout << "└── ";
            prefix += "    ";
        } else {
            cout << "├── ";
            prefix += "│   ";
        }

        cout << node->data;
        if (node->isEndOfWord)
            cout << " (word)";
        cout << endl;

        int count = 0;
        for (int i = 0; i < 26; i++)
            if (node->children[i])
                count++;

        int i = 0;
        for (int j = 0; j < 26; j++) {
            if (node->children[j]) {
                i++;
                displayTreeHelper(node->children[j], prefix, i == count);
            }
        }
    }

public:
    Trie() {
        root = new TrieNode('\0');
    }

    void insert(string word) {
        TrieNode* current = root;
        for (char c : word) {
            int index = c - 'a';
            if (!current->children[index])
                current->children[index] = new TrieNode(c);
            current = current->children[index];
        }
        current->isEndOfWord = true;
    }

    bool search(string word) {
        TrieNode* current = root;
        for (char c : word) {
            int index = c - 'a';
            if (!current->children[index])
                return false;
            current = current->children[index];
        }
        return current->isEndOfWord;
    }

    void remove(string word) {
        if (search(word)) {
            deleteHelper(root, word, 0);
            cout << "Word deleted successfully\n";
        } else {
            cout << "Word not found\n";
        }
    }

    void spellCheck(string word) {
        if (search(word)) {
            cout << "Correct spelling\n";
        } else {
            cout << "Incorrect spelling\n";
            cout << "Did you mean:\n";

            // Find longest valid prefix
            TrieNode* current = root;
            string prefix = "";
            for (char c : word) {
                int index = c - 'a';
                if (!current->children[index]) break;
                current = current->children[index];
                prefix += c;
            }

            if (prefix.empty()) {
                cout << "No suggestions found\n";
            } else {
                autocompleteHelper(current, prefix);
            }
        }
    }

    void autocomplete(string prefix) {
        TrieNode* current = root;
        for (char c : prefix) {
            int index = c - 'a';
            if (!current->children[index]) {
                cout << "No suggestions found\n";
                return;
            }
            current = current->children[index];
        }
        cout << "Suggestions:\n";
        autocompleteHelper(current, prefix);
    }

    void displayAsTree() {
        cout << "\nTrie Structure:\n";
        cout << "Root\n";

        int count = 0;
        for (int i = 0; i < 26; i++)
            if (root->children[i])
                count++;

        int i = 0;
        for (int j = 0; j < 26; j++) {
            if (root->children[j]) {
                i++;
                displayTreeHelper(root->children[j], "", i == count);
            }
        }
    }
};

int main() {
    Trie trie;
    int choice;
    string word;

    do {
        cout << "\n--- TRIE MENU ---\n";
        cout << "1. Insert\n";
        cout << "2. Search\n";
        cout << "3. Delete\n";
        cout << "4. Spell Check\n";
        cout << "5. Autocomplete\n";
        cout << "6. Display Trie Tree\n";
        cout << "7. Exit\n";
        cout << "Enter your choice: ";
        cin >> choice;

        switch (choice) {
        case 1:
            cout << "Enter word to insert: ";
            cin >> word;
            trie.insert(word);
            cout << "Word inserted successfully\n";
            break;

        case 2:
            cout << "Enter word to search: ";
            cin >> word;
            if (trie.search(word))
                cout << "Word found\n";
            else
                cout << "Word not found\n";
            break;

        case 3:
            cout << "Enter word to delete: ";
            cin >> word;
            trie.remove(word);
            break;

        case 4:
            cout << "Enter word to spell check: ";
            cin >> word;
            trie.spellCheck(word);
            break;

        case 5:
            cout << "Enter prefix: ";
            cin >> word;
            trie.autocomplete(word);
            break;

        case 6:
            trie.displayAsTree();
            break;

        case 7:
            cout << "Exiting program...\n";
            break;

        default:
            cout << "Invalid choice\n";
        }

    } while (choice != 7);

    return 0;
}

