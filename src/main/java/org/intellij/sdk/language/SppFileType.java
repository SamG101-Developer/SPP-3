package org.intellij.sdk.language;

import com.intellij.openapi.fileTypes.LanguageFileType;
import com.intellij.openapi.util.NlsContexts;
import com.intellij.openapi.util.NlsSafe;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;


public class SppFileType extends LanguageFileType {
    public static final SppFileType INSTANCE = new SppFileType();

    private SppFileType() {
        super(SppLanguage.INSTANCE);
    }

    @Override
    public @NonNls @NotNull String getName() {
        return "S++ File";
    }

    @Override
    public @NlsContexts.Label @NotNull String getDescription() {
        return "S++ language file";
    }

    @Override
    public @NlsSafe @NotNull String getDefaultExtension() {
        return "spp";
    }

    @Override
    public Icon getIcon() {
        return SppIcons.FILE;
    }
}
