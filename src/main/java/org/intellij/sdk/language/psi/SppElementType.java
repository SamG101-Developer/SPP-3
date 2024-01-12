package org.intellij.sdk.language.psi;

import com.intellij.psi.tree.IElementType;
import org.intellij.sdk.language.SppLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class SppElementType extends IElementType {
    public SppElementType(@NotNull @NonNls String debugName) {
        super(debugName, SppLanguage.INSTANCE);
    }
}
