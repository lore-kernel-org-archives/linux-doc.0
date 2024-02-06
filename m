Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82345134CF1
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707235706; cv=none; b=XB+FIthgB5WsTBMA6ptVCxB0SqH5UUT0Z2MH0WmvdsGPx7ks0VSInFUqquwXJqHMnXR2/Ex1VVYMrl0zkCWxPkgRJQjml7i+sQcKoxIAxtf7pKlwGcJkmqqxZr38mPMlz8fmwm90WRBhdamSX7NjipGejiNcOs9DRSWFYeNRWi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707235706; c=relaxed/simple;
	bh=KUcH2w81ubI6j+hIl4/fL/PRZok6JmE46tdEn9wd4Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bum7r6vRFPFEyGt5MxSXbEiYnU7M1PKguf1HkDN8M3LlrE2+tInUXJ/Mga8FGWPQ9bVtKBd22qiRsp1fC31FBAjGs6JnPdyITyakQpBRjFXotmMlJS9XO6TIhWbcYN+na0lGxCpggsn3AQWXgTVhrJ3UwF9fpLMnD7Np/Jivph8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S3WP5U14; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S3WP5U14"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912C8C433C7;
	Tue,  6 Feb 2024 16:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707235706;
	bh=KUcH2w81ubI6j+hIl4/fL/PRZok6JmE46tdEn9wd4Nw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S3WP5U14uqmA3p9a8Md3pQhpJcIM5uOrn+NlEVp5BT06C2zVNgUchtCpoBQzmPOC0
	 /iB5tBGYWmV0K4+3CFi2AFpH9Ud/6L/Dd+tiKoTv7XCtKARgSt3rcZj2nu0kcBzw7E
	 xK6Gmd/K1Usk6kOIo0xnKqO8rNFvKHx+dj1uzJjiYcUynTx7W8iUpDXR1p1dOIaZ1e
	 TCVXwIU2qogpnEZ5yVUjxYARMaoz4sfu8lzQZM0glth+jyBYtYkIEuZ6taB7TrxXxu
	 /ZOBnXAxAkctZGY7ykYlN6B2ZGct+Gmbm3un5JG3B2tGTVvVsli4JfnveSmdC+CPEA
	 HoDPErCRSafYw==
Date: Tue, 6 Feb 2024 17:08:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet
 <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 6/8] doc: kfigure.py: convert to sphinx.util.logging
Message-ID: <20240206170819.08f3e31a@coco.lan>
In-Reply-To: <87zfwec6m7.fsf@intel.com>
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
	<20240205175133.774271-7-vegard.nossum@oracle.com>
	<87zfwec6m7.fsf@intel.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 06 Feb 2024 10:57:36 +0200
Jani Nikula <jani.nikula@intel.com> escreveu:

> On Mon, 05 Feb 2024, Vegard Nossum <vegard.nossum@oracle.com> wrote:
> > As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
> > to 2.4.4"), we can use Sphinx's built-in logging facilities.
> >
> > Gotchas:
> > - remove first argument 'app' from all calls
> > - instead of (fmt % (args)), use (fmt, args)
> > - instead of ("<fmt>: " + str) use ("<fmt: %s>", str)  
> 
> If you're doing this, why not go directly to f-strings? IMO the above
> are inferior to it.

Hmm... f-strings require at least python 3.6. Not sure what's the current
requirement.

On a quick check wit vermin:

<snip>
$ vermin -v $(git ls-files "*.py"|grep -v tools)

!2, 3.3      Documentation/conf.py
2.6, 3.0     Documentation/networking/device_drivers/atm/cxacru-cf.py
!2, 3.6      Documentation/sphinx/automarkup.py
2.4, 3.0     Documentation/sphinx/cdomain.py
2.7, 3.1     Documentation/sphinx/kernel_abi.py
2.7, 3.1     Documentation/sphinx/kernel_feat.py
2.3, 3.0     Documentation/sphinx/kernel_include.py
2.5, 3.0     Documentation/sphinx/kerneldoc.py
~2, ~3       Documentation/sphinx/kernellog.py
!2, 3.3      Documentation/sphinx/kfigure.py
2.5, 3.0     Documentation/sphinx/load_config.py
2.3, 3.0     Documentation/sphinx/maintainers_include.py
2.3, 3.0     Documentation/sphinx/rstFlatTable.py
!2, 3.0      Documentation/sphinx/translations.py
2.0, !3      Documentation/trace/postprocess/decode_msr.py
File with incompatible versions: Documentation/trace/postprocess/decode_msr.py
2.3, 3.0     Documentation/userspace-api/media/conf_nitpick.py
!2, 3.5      drivers/gpu/drm/ci/check-patch.py
!2, 3.6      drivers/gpu/drm/ci/xfails/update-xfails.py
!2, 3.7      scripts/bpf_doc.py
!2, 3.3      scripts/checkkconfigsymbols.py
~2, ~3       scripts/gdb/linux/__init__.py
2.2, 3.0     scripts/gdb/linux/clk.py
2.5, 3.0     scripts/gdb/linux/config.py
2.7, 3.0     scripts/gdb/linux/cpus.py
2.7, 3.0     scripts/gdb/linux/device.py
2.6, 3.0     scripts/gdb/linux/dmesg.py
2.7, 3.0     scripts/gdb/linux/genpd.py
2.7, 3.0     scripts/gdb/linux/interrupts.py
2.7, 3.0     scripts/gdb/linux/lists.py
2.3, 3.0     scripts/gdb/linux/mm.py
2.6, 3.0     scripts/gdb/linux/modules.py
2.3, 3.0     scripts/gdb/linux/page_owner.py
!2, 3.6      scripts/gdb/linux/pgtable.py
2.7, 3.0     scripts/gdb/linux/proc.py
2.7, 3.0     scripts/gdb/linux/radixtree.py
2.7, 3.0     scripts/gdb/linux/rbtree.py
2.7, 3.0     scripts/gdb/linux/slab.py
~2, ~3       scripts/gdb/linux/stackdepot.py
2.7, 3.0     scripts/gdb/linux/symbols.py
2.7, 3.0     scripts/gdb/linux/tasks.py
2.7, 3.0     scripts/gdb/linux/timerlist.py
2.7, 3.0     scripts/gdb/linux/utils.py
2.2, 3.0     scripts/gdb/linux/vfs.py
2.2, 3.0     scripts/gdb/linux/vmalloc.py
2.3, 3.0     scripts/gdb/vmlinux-gdb.py
!2, 3.6      scripts/generate_rust_analyzer.py
~2, ~3       scripts/kconfig/tests/auto_submenu/__init__.py
~2, ~3       scripts/kconfig/tests/choice/__init__.py
~2, ~3       scripts/kconfig/tests/choice_value_with_m_dep/__init__.py
!2, 3.2      scripts/kconfig/tests/conftest.py
~2, ~3       scripts/kconfig/tests/err_recursive_dep/__init__.py
~2, ~3       scripts/kconfig/tests/err_recursive_inc/__init__.py
~2, ~3       scripts/kconfig/tests/inter_choice/__init__.py
~2, ~3       scripts/kconfig/tests/new_choice_with_dep/__init__.py
~2, ~3       scripts/kconfig/tests/no_write_if_dep_unmet/__init__.py
~2, ~3       scripts/kconfig/tests/preprocess/builtin_func/__init__.py
~2, ~3       scripts/kconfig/tests/preprocess/circular_expansion/__init__.py
~2, ~3       scripts/kconfig/tests/preprocess/escape/__init__.py
~2, ~3       scripts/kconfig/tests/preprocess/variable/__init__.py
!2, 3.9      scripts/rust_is_available_test.py
!2, 3.2      scripts/spdxcheck.py
2.3, 3.0     scripts/tracing/draw_functrace.py
</snip>

It sounds that automarkup is already requiring 3.6, so it should be ok
to use it here too (also because it uses f-strings):

	$ vermin -vv Documentation/sphinx/automarkup.py 
	Detecting python files..
	Analyzing using 8 processes..
	!2, 3.6      /new_devel/v4l/media_tree/Documentation/sphinx/automarkup.py
	  'itertools' module requires 2.3, 3.0
	  'sorted' member requires 2.4, 3.0
	  'sorted(key)' requires 2.4, 3.0
	  `with` requires 2.5, 3.0
	  f-strings require !2, 3.6
	...

There are still:

	scripts/bpf_doc.py requires 3.7
	rust_is_available_test.py requires 3.9.

But those don't seem to be part of the build.


Anyway, I would expect that the minimal python version to be listed at:

	Documentation/process/changes.rst

Apparently, it isn't. IMO, we need to document there that python
3.6 is the minimal version required to build the Kernel - or
at least the documentation.


Thanks,
Mauro
