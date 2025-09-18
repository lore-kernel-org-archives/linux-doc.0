Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8717F24A047
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 12:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758197236; cv=none; b=NAT/S6ByZy7Aeq9+kk4/cepxTmJYrT5bR1xDZ7MKrwNi6/ev1omUrHaCSdvlwkLPgZ5wz8v19m4/voxXlER3ddib1WxBlt+MFAHcrnYXdXqexzK3ebkdtw/kiBi2vTmkoGrlWRHSLiCDyjhNOJaRgoC2KHl360lG2JUUyxJT75w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758197236; c=relaxed/simple;
	bh=jZWL9Duak7GFy0Y1dVEuoX+zXr5Ys6ZsH6D1nrCD81E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tgEvtugQUsSpZkNyEKhVPGI+n4+5dHCEh++veo/4ODyxfdRs+SE53GIcmAnLVPnfgV2+iS0VNO54xT7tTRQyx2vdMiysZ8A/ysPSPpG/hZrlU012fihdLtI6/sClRwFJbj1uDUVHQMicHuKVDIlAXM+VwkYwsNIq653jVg8SVEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ju17wQtI; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ju17wQtI"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77287fb79d3so898797b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 05:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758197234; x=1758802034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=95YdQK3Hm4Y4uu/IbHgVNrQE68pVtuEFxtuVg9m+X+o=;
        b=ju17wQtI5mF+uvt3ZGLMNgHCGjHYUVBzM0dP2F7qP97Yj3T/bNvuIJaL8LB2rZY4SB
         419X5FE3SfYA5A7kece0UPFANlEOePhf0LPdvFgSDpgMmtQcjG1wyE9bJKbONlhC0r2I
         rpM53Ni8RKjb9uslvofw3BUz4I7QknADU1N+NvnwSoQxwdSxaj0cdfv+psj+xR1szlO0
         avbT+xgdH46ql7qyxl1A2SAvJWM/M6AmqCRCZAHutAbBpVysZd8YxJGS/RW9erK1m84v
         SDxEEmcW9133OHTQEdjK+a1M9FfAbv/cW/MWxSC6LQXDZGT3CEozVt/Ds1tSfsz8/oCt
         n8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758197234; x=1758802034;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=95YdQK3Hm4Y4uu/IbHgVNrQE68pVtuEFxtuVg9m+X+o=;
        b=GMDWVpqQeGoffm/gWFLDuSlYoJB/G4bovYk8bRazVqU7K/DoDCjAGi1HGQKcYfGj2X
         zNABrJkspXxOvjW/YZiM3CNoW6wglQAtacbbI2DD7S7qMv+ihtVfcil/JO1MV1A6gycw
         bUAA8Py1EfFQtq2BS4ONXC+Vdk5aGweEai3q8h4y/bZiKjnQo1BgDRdSpiJHL5c1eHU+
         FSaHAMemuwaprkGqGtQByF/PcRcx5ogFT4FzuLcqH8dehjTVaqXVRMadQhLIzTLyMX6s
         VqoV3LT9w0SqI0a6muGPqN2yQ5DBLEPVLophX+7TrHqSPrmh5OFlpV5F99iBPkBfrGBf
         g59A==
X-Forwarded-Encrypted: i=1; AJvYcCVmPr6+XQhZxSERQpCGnBdwMrjJwuIkeKqKAJAX7y2cTAkF9eBWElrvkAtgp6cx/GelKE0T7iSyDwk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy38523lfrSwptus+mzfjhT4q/GQAdUMTZizs6W50rgbZQ0kP+U
	pdWjiQgZ/hXCflMuqKB9XP98C6mxFp5Zbg9XLq8HjWpFKK0xfSXiaPRG
X-Gm-Gg: ASbGncuztD9nDg8IX52MOfskeb0iYIrMtuH4HLlvBXbQOIzR9tCoIQYHOCkQW5dI0jW
	7yBJq4GyHaIfbDZAfadV5qMviAVoAo/JsnjADoaGlN6Q7RPEOyL/Pui+i7HlENTM3PygQDouDAU
	UtUtCIV2NqGljqEvPPmuRU7rLx2taQ9G3kMsG7dlhiujKMnp/GyXTQ70OYVMcwdfzDsohkN2OTl
	zd6Iir8zmq67BlVCG7/QJYsaUZjJhoQVZUV5f9TplhwhxMrnvKoqeY+/BQbbyqiTiHnGReUuI7u
	URdYGHjj+LkDBd7zFFnbSkaLILa3E+BaoQe0jaHDbbM3UNfxfacvW7ylBwpdprxO459MwxrP+2T
	E/4o9EpgZlk/3CzGGU9Mi8e2nL3NtbgVNcuel4d5RaA0zKIkxEaG6Gii6bH9uPFsYBrhc1hO1yu
	oOCv06qb7KtbI=
X-Google-Smtp-Source: AGHT+IFyXFI8nxqkz/JaWSHx1xl1zCk2p9wkYWg+fLWyCvJgCN+CdAzc9qBA5eGAYC1YFeYmdCI5UA==
X-Received: by 2002:a17:902:f650:b0:25c:4b44:1f30 with SMTP id d9443c01a7336-268138fd1f2mr69949715ad.45.1758197233406;
        Thu, 18 Sep 2025 05:07:13 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016d9d5sm24410045ad.53.2025.09.18.05.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 05:07:12 -0700 (PDT)
Message-ID: <5031e0c4-f17e-41b8-8955-959989e797f2@gmail.com>
Date: Thu, 18 Sep 2025 21:07:10 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v7 11/24] tools/docs: sphinx-build-wrapper: add a wrapper
 for sphinx-build
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <cover.1758111077.git.mchehab+huawei@kernel.org>
 <820f986c9b61637e5af6708a014e36d70740bcb7.1758111077.git.mchehab+huawei@kernel.org>
Content-Language: en-US
In-Reply-To: <820f986c9b61637e5af6708a014e36d70740bcb7.1758111077.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[+CC: Jani, -CC: rust people and list]

Hi, (just got v8, but sending anyway ...)

Now that I could actually apply v7 of the series, here is a
(not-so-much knee-jerk) reaction to this change.
Please see below.

On Wed, 17 Sep 2025 14:15:05 +0200, Mauro Carvalho Chehab wrote:
> There are too much magic inside docs Makefile to properly run
> sphinx-build. Create an ancillary script that contains all
> kernel-related sphinx-build call logic currently at Makefile.
> 
> Such script is designed to work both as an standalone command
> and as part of a Makefile. As such, it properly handles POSIX
> jobserver used by GNU make.
> 
> On a side note, there was a line number increase due to the
> conversion (ignoring comments) is:
> 
>  Documentation/Makefile          |  131 +++----------
>  tools/docs/sphinx-build-wrapper |  293 +++++++++++++++++++++++++++++++
>  2 files changed, 323 insertions(+), 101 deletions(-)
> 
> Comments and descriptions adds:
>  tools/docs/sphinx-build-wrapper | 261 +++++++++++++++++++++++++++++++-
> 
> So, about half of the script are comments/descriptions.
> 
> This is because some things are more verbosed on Python and because
> it requires reading env vars from Makefile. Besides it, this script
> has some extra features that don't exist at the Makefile:
> 
> - It can be called directly from command line;
> - It properly return PDF build errors.
> 
> When running the script alone, it will only take handle sphinx-build
> targets. On other words, it won't runn make rustdoc after building
> htmlfiles, nor it will run the extra check scripts.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/Makefile          | 129 ++-----
>  tools/docs/sphinx-build-wrapper | 599 ++++++++++++++++++++++++++++++++
>  2 files changed, 627 insertions(+), 101 deletions(-)
>  create mode 100755 tools/docs/sphinx-build-wrapper
> 
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index fd6399c79fab..380284026c13 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
[...]

> +# Common documentation targets
> +infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:
> +	$(Q)@$(srctree)/tools/docs/sphinx-pre-install --version-check
> +	+$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \
> +		--sphinxdirs="$(SPHINXDIRS)" --conf="$(SPHINX_CONF)" \
> +		--builddir="$(BUILDDIR)" --deny-vf=$(FONTS_CONF_DENY_VF) \
> +		--theme=$(DOCS_THEME) --css=$(DOCS_CSS) --paper=$(PAPER)
>  
[...]
> +# Special handling for pdfdocs
> +ifneq ($(shell which $(PDFLATEX) >/dev/null 2>&1; echo $$?),0)
> +pdfdocs:
> +	$(warning The '$(PDFLATEX)' command was not found. Make sure you have it installed and in PATH to produce PDF output.)
> +	@echo "  SKIP    Sphinx $@ target."
>  endif
[...]

> +	$(Q)@$(srctree)/tools/docs/sphinx-pre-install --version-check
> +	+$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \
> +		--sphinxdirs="$(SPHINXDIRS)" --conf="$(SPHINX_CONF)" \
> +		--builddir="$(BUILDDIR)" \
> +		--theme=$(DOCS_THEME) --css=$(DOCS_CSS) --paper=$(PAPER)
>  # If Rust support is available and .config exists, add rustdoc generated contents.
>  # If there are any, the errors from this make rustdoc will be displayed but
>  # won't stop the execution of htmldocs
> @@ -118,49 +85,6 @@ ifeq ($(CONFIG_RUST),y)
>  endif
>  endif
>  
[...]

> -
> -latexdocs:
> -	@$(srctree)/tools/docs/sphinx-pre-install --version-check
> -	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,latex,$(var),latex,$(var)))
> -
> -ifeq ($(HAVE_PDFLATEX),0)
> -
> -pdfdocs:
> -	$(warning The '$(PDFLATEX)' command was not found. Make sure you have it installed and in PATH to produce PDF output.)
> -	@echo "  SKIP    Sphinx $@ target."
> -
> -else # HAVE_PDFLATEX
> -
> -pdfdocs: DENY_VF = XDG_CONFIG_HOME=$(FONTS_CONF_DENY_VF)
> -pdfdocs: latexdocs

So, this is removing explicit dependency from pdfdocs to latexdocs.

Although it is rare, there is a small chance where Sphinx latex builder
crashes and can't complete generating all the necessary files (.tex, .sty).

In such cases, I want "make pdfdocs" to give up immediately and not to
try to run $(PDFLATEX) at all.

It looks like "./tools/docs/sphinx-build-wrapper pdfdocs" doesn't give up
at the latexdocs stage in such cases with default SPHINXDIRS="." and
continues to run $(PDFLATEX) anyway.

As a matter of fact, recent linux-next does exhibit such crashes in the
latexdocs stage:

As of next-20250917, running:
    make cleandocs: make pdfdocs" will end up in this way:

--------------------------------------------------------------
[...]
Markup is unsupported in LaTeX!

Versions
========

[...]

Last Messages
=============

        filesystems/xfs/xfs-delayed-logging-design
        filesystems/xfs/xfs-maintainer-entry-profile
        filesystems/xfs/xfs-self-describing-metadata
        filesystems/xfs/xfs-online-fsck-design
       filesystems/zonefs

    resolving references...
    processing filesystems.tex: done
    writing...
    failed

Loaded Extensions
=================

[...]

Traceback
=========

      File "/[...]/sphinx-8.2.3/lib/python3.12/site-packages/sphinx/writers/latex.py", line 1152, in visit_table
        raise UnsupportedError(
    sphinx.writers.latex.UnsupportedError: filesystems/f2fs:: longtable does not support nesting a table.

[...]

make[2]: *** [Documentation/Makefile:138: latexdocs] Error 2
make[1]: *** [/home/akira/git/linux/Makefile:1805: pdfdocs] Error 2
make: *** [Makefile:248: __sub-make] Error 2
--------------------------------------------------------------

If you merge your v7 series into linux-next and resolve confilcts properly,
running the same:

    make cleandocs; make pdfdocs

will end in this way:

Error: Can't build 45 PDF file(s): pdf/RCU.pdf, pdf/admin-guide.pdf, pdf/locking.pdf, pdf/dev-tools.pdf, pdf/process.pdf, pdf/core-api.pdf, pdf/mm.pdf, pdf/virt.pdf, pdf/block.pdf, pdf/sound.pdf, pdf/kernel-hacking.pdf, pdf/networking.pdf, pdf/infiniband.pdf, pdf/leds.pdf, pdf/maintainer.pdf, pdf/crypto.pdf, pdf/fb.pdf, pdf/accounting.pdf, pdf/livepatch.pdf, pdf/nvme.pdf, pdf/hid.pdf, pdf/isdn.pdf, pdf/trace.pdf, pdf/i2c.pdf, pdf/fault-injection.pdf, pdf/netlabel.pdf, pdf/staging.pdf, pdf/timers.pdf, pdf/firmware-guide.pdf, pdf/hwmon.pdf, pdf/scheduler.pdf, pdf/tools.pdf, pdf/watchdog.pdf, pdf/mhi.pdf, pdf/power.pdf, pdf/devicetree.pdf, pdf/arch.pdf, pdf/spi.pdf, pdf/userspace-api.pdf, pdf/translations.pdf, pdf/fpga.pdf, pdf/cpu-freq.pdf, pdf/security.pdf, pdf/bpf.pdf, pdf/pcmcia.pdf

Returning back to next-20250917, running with additional options to GNU Make:

    make clean; make -k -i pdfdocs

behaves mostly the same as the one with sphinx-build-wrapper, which ends up
like this:

-----------------------------------------------------------------------
[...]

make[3]: [Makefile:29: virt.pdf] Error 12 (ignored)
mv: cannot stat 'Documentation/output/./latex/RCU.pdf': No such file or directory
mv: cannot stat 'Documentation/output/./latex/accounting.pdf': No such file or directory
mv: cannot stat 'Documentation/output/./latex/admin-guide.pdf': No such file or directory
[...]

mv: cannot stat 'Documentation/output/./latex/virt.pdf': No such file or directory
mv: cannot stat 'Documentation/output/./latex/watchdog.pdf': No such file or directory
make[2]: [Documentation/Makefile:151: pdfdocs] Error 1 (ignored)
-----------------------------------------------------------------------

As you might have already noticed, GNU Make provides useful and convinenent
command options readily availabe.  Some of those I often use include:

   -i, --ignore-errors
        Ignore all errors in commands executed to remake files.

   -k, --keep-going
        Continue as much as possible after an error.  While the target
        that failed, and those that depend on it, cannot be remade, the
        other dependencies of these targets can be processed all the same.

   -O[type], --output-sync[=type]
        When  running multiple jobs in parallel with -j, ensure the output
        of each job is collected together rather  than  interspersed  with
        output from other jobs. [...]

There are abundunt of other helpful options for various situations.

Your change of pdfdocs recipe would deprive me of those flexible options
of GNU Make.  Because passing those options through MAKEFLAGS is
availabe in sub-make invocation of $(MAKE) [1].

[1]: https://www.gnu.org/software/make/manual/html_node/Options_002fRecursion.html

And it would diverge our scheme of pdfdocs build from that of Sphinx's
latex builder's choice.

I don't think re-implementing GNU Make's (limited range of) behavior in
python can be justified just because Makefile's way of describing recipes
look "magic" to your eyes.

Honestly speaking, I just trunt the history proven tool much more than your
re-implementation.  I'm sure I would miss that make--sub-make chain if your
sphinx-build-wrapper were employed in pdfdocs target.

As I said above, the behavior you wants can be achieved by using a couple
of options to GNU Make. (Give or take the "|| exit;" case.)
I'm more inclined to continue using existing approach.

In summary, this is my suggestion for the development for the v6.19 (not v6.18)
merge window.

1) Using sphinx-build-wrapper in (*}docs targets other than pdfdocs is the way
   to go.

2) pdfdocs should be a different target that depends on latexdocs.

3) Preserve the make--sub-make chain in the pdfdocs recipe. (for easy access
   to GNU Make's options)

4) sphinx-build-wrapper has own its rights to cover pdfdocs.  I don't care
   how it behaves when it is directly called for pdfdocs.

5) Build summary as the final message from "make pdfdocs" is a good idea and
   it should be doable in the Makefile recipe in a different manner.

6) The issue Mauro calls "false positive" (the "|| exit;" pattern in Makefile's
   loop) might be a desired behavior, but it should be possible to add a knob
   to suppress it in the Makefile.

Mauro, how does this "compromize" sound to you?

Regards,
Akira

> -	@$(srctree)/tools/docs/sphinx-pre-install --version-check
> -	$(foreach var,$(SPHINXDIRS), \
> -	   $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" $(DENY_VF) -C $(BUILDDIR)/$(var)/latex || $(PYTHON3) $(srctree)/tools/docs/check-variable-fonts.py || exit; \
> -	   mkdir -p $(BUILDDIR)/$(var)/pdf; \
> -	   mv $(subst .tex,.pdf,$(wildcard $(BUILDDIR)/$(var)/latex/*.tex)) $(BUILDDIR)/$(var)/pdf/; \
> -	)
> -
[...]

