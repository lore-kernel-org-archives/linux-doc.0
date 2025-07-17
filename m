Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AB4219EB
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752750569; cv=none; b=HMQ2SiwqNixnamfYE7YPvZ1hwferWdE0i0jac9DKmKSzAAnM4VTI6pmlz1C86BZgI+KkxYVOuC92CTEaAhg3swxatFDe5azhiFchDPvw+PPbi1ojyQgyfw7tEM4F9k6wf9H+llaMvBQhqjN/6oGSsucJoADwrwqilMshFiN/l0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752750569; c=relaxed/simple;
	bh=eybw7eHJIPQe/HMYAFxBsm2i//4fdASepyAcJ4RhvJk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RHrmLGAgjooNY8oRLYn2//jyO82U06g2qaHrDp7/oQJwro29sRK0IdyhLzwb8tgfvjM4dTkZjehwfbk8kRjgd/BJjz4GXAcVdcAs5RxWYZEJZTxuz4CJ4ScPCPeV1xwRQ/B0v8LtThqYSbNbyk/WGWyjM1GpWkDKoP/EuhT5NUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bJJPw95f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bJJPw95f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B607C4CEE3;
	Thu, 17 Jul 2025 11:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752750568;
	bh=eybw7eHJIPQe/HMYAFxBsm2i//4fdASepyAcJ4RhvJk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bJJPw95fpx5+5rTNK1wBp+VXLf8bO5dVoSYOWq5ReyUOY9nSLt82m2k57NSy4TzR9
	 9TQ/Jz8pxyYYJCEpx3eCSlcCIvKlU5MxWY18FixsU5A89X9o5oJIWE5huz6093b/qG
	 lSTFpCdgtOzrrvFSnuuHVYideLsU4tbyRe7iFX+dCihhWgLBWER5ePiNuxNGNn8a+5
	 iWlD9C7evRaB24IWAU4OgySfRmA4byBVFcrlYolJSqmQg2Tb1zsj3aaKzTEBEss2vO
	 VWPhs4pMTImhLWZf9MntF3Y5Mwbx8uKybtg26KjyHfwZEbfoQP4/Pp4qHQKXIkJdiC
	 CJf95Tkb3tq2g==
Date: Thu, 17 Jul 2025 13:09:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-doc@vger.kernel.org, Donald Hunter
 <donald.hunter@gmail.com>
Subject: Re: [Performance Regression since v6.15] empty docs build with O=
 option
Message-ID: <20250717130904.0ce397b4@foz.lan>
In-Reply-To: <c174f7c5-ec21-4eae-b1c3-f643cca90d9d@gmail.com>
References: <c174f7c5-ec21-4eae-b1c3-f643cca90d9d@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Akira,

Em Mon, 14 Jul 2025 19:42:49 +0900
Akira Yokosawa <akiyks@gmail.com> escreveu:

> Hi all,
> 
> Here is a follow-up to my message at:
> https://lore.kernel.org/d12fb63e-b346-4094-b9d6-aa6823aea541@gmail.com/
> 
> Quoting relevant parts for your convenience:
> 
> Akira wrote:
> > As a matter of fact, I'm seeing weird performance regression of empty
> > documentation builds when the O=<somedir> option is used.
> >
> > It appeared in v6.15, which has your conversion of get_abi.pl into
> > get_abi.py.  Will send a report once the time-consuming bisection
> > completes.  
> 
> Answer to Mauro's question at:
> https://lore.kernel.org/20250711130446.1b761538@foz.lan/
> 
> Mauro wrote:
> > Did you try with docs-next instead? I remember Jon caught one
> > issue causing the doctree cache to expire. Can't remember if this
> > was on 6.15 or at docs-next, but the fixes should be applied there.  
> 
> Jon's complaint at https://lore.kernel.org/87frfsdfgc.fsf@trenco.lwn.net/
> was against Mauro's v2 series.
> 
> Jon has applied the v3 series with the issue fixed at:
> https://lore.kernel.org/cover.1750571906.git.mchehab+huawei@kernel.org/
> 
> , so the issue has never been in docs-next.
> 
> I'm not a python person and bisection is all I could do.

This is probably not a python issue itself, but instead, some
weirdness at the way Sphinx cache is stored.

> TL;DR
> 
> 2nd run of "make O=$HOME/output htmldocs" takes much longer since kernel
> release v6.15.
> 
> 2nd run is an empty build and should finish in a matter of 10 seconds.
> 
> "make htmldocs" without the O= option doesn't show this symptom.
> 
> Here is a summary table.
> 
> Note:
>     Numbers shown as (x) [y] mean 2nd "make O=$HOME/output htmldocs" run
>     takes x seconds, while 2nd "make htmldocs" run takes y seconds
>     (rounded up).
> 
>        ----------------------------------------
> Sphinx      8.2.3 venv       8.1.3     7.2.6 
>        ------------------- --------- ----------
> Distro    f42      noble      f42      noble 
>        --------- --------- --------- ----------
> Good   (13) [13] (16) [16] ( 6) [ 6] (  9) [ 9] v6.14
> Bad            ---         (72) [ 6] (349) [11] v6.15
> Bad            ---         (72) [ 6] (365) [11] v6.16-rc1 + [1]
> Bad            ---         (72) [ 7] (342) [10] docs-next (2025.07.11) + [1]
> Bad    (77) [14] (82) [15] (73) [ 8] (347) [11] docs-next (2025.07.11) + [1,2,3]
>        --------- --------- --------- ----------
> 
> [1]: cherry-pick 553ab30a1810 ("Documentation: nouveau: Update GSP message
>      queue kernel-doc reference"), to suppress noise of error handling within
>      Sphinx.
> [2]: Mauro's ynl series v9 at https://lore.kernel.org/cover.1752076293.git.mchehab+huawei@kernel.org/
>      (14/13 applied)
> [3]: Jon's kdoc series v2 at https://lore.kernel.org/20250710233142.246524-1-corbet@lwn.net/
>      (12/12 as is)
> 
> f42: python 3.13.5, noble: 3.12.3
> 
> * Bisection result
> 
> Sphinx 8.2.3 (venv) on top of ubuntu:noble (python 3.12.3):
> 
> Last good commit:
> (16) 6b48bea16848 ("scripts/get_abi.py: add support for symbol search")
> 
> First bad commit:
> (48) 9d7ec8867960 ("docs: use get_abi.py for ABI generation")
> 
> Merged into Jon's docs-mw branch at:
> (82) 1ce8294cfefb ("Merge branch 'mauro' into docs-mw")
> 
> Pre merge commits of 1ce8294cfefb:
> (15) 2b087edf588c ("docs/zh_CN: Add secrets index Chinese translation")
> (82) 1c7e66bc5d20 ("scripts/get_abi.pl: drop now obsoleted script")
> 
> Again, The numbers enclosed in () indicate the elapsed times (in seconds,
> rounded up) of 2nd "make O=$HOME/output htmldocs" runs.
> 
> Sphinx 8.2.3 takes longer than 8.1.3 for empty builds, but it is likely
> an independent issue on Sphinx side.
> 
> Mauro, I'd like you to have a look into this regression.
> 
>         Thanks, Akira

To debug it, I added the enclosed code to conf.py. See enclosed. The
logic there uses this from https://www.sphinx-doc.org/en/master/extdev/event_callbacks.html:

	env-get-outdated(app, env, added, changed, removed)

	Emitted when the environment determines which source files have
	changed and should be re-read. added, changed and removed are 
	sets of docnames that the environment has determined. You can 
	return a list of docnames to re-read in addition to these.


Assuming that the issue is during ABI generation, we can check with that
what is the root case.

Running the second time without O= doeesn't require rebuild ABI:

    $ time make SPHINXDIRS=admin-guide htmldocs
    Python version: 3.13.5
    Docutils version: 0.21.2
    make[3]: Nothing to be done for 'html'.
    Using alabaster theme
    source directory: admin-guide
    Using Python kernel-doc

    [OUTDATED]
    Added: set()
    Changed: {'gpio/obsolete', 'gpio/index'}
    Removed: set()
    All docs count: 385
    Found docs count: 385
    /root/Documentation/admin-guide/gpio/index.rst:7: WARNING: toctree contains reference to nonexisting document 'userspace-api/gpio/chardev' [toc.not_readable]
    /root/Documentation/admin-guide/gpio/obsolete.rst:7: WARNING: toctree contains reference to nonexisting document 'userspace-api/gpio/chardev_v1' [toc.not_readable]
    /root/Documentation/admin-guide/gpio/obsolete.rst:7: WARNING: toctree contains reference to nonexisting document 'userspace-api/gpio/sysfs' [toc.not_readable]

    real    0m1,489s
    user    0m1,305s
    sys     0m0,263s

Here, it seems that the root cause is because of a non-resolved
dependency at gpio/obsolete.

Now, running the second time with O=, we have:


    $ make clean; time make O=/tmp/foo SPHINXDIRS=admin-guide htmldocs
    ...

    [OUTDATED]
    Added: set()
    Changed: {'abi-stable', 'abi-testing-files', 'abi-removed', 'gpio/index', 'abi-obsolete-files', 'abi-testing', 'abi-stable-files', 'abi-obsolete', 'gpio/obsolete', 'abi-removed-files', 'abi'}
    Removed: set()
    All docs count: 385
    Found docs count: 385

Basically, Sphinx thinks that abi* files had some changes, but
only when O= is used.

At Documentation/sphinx/kernel_abi.py, the only part we touch the
dependency chain is here:

            if f != old_f:
                # Add the file to Sphinx build dependencies
                env.note_dependency(os.path.abspath(f))

If we comment such code or change the logic to:

    diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
    index db6f0380de94..9f2198eb7af1 100644
    --- a/Documentation/sphinx/kernel_abi.py
    +++ b/Documentation/sphinx/kernel_abi.py
    @@ -146,8 +146,9 @@ class KernelCmd(Directive):
                 n += 1
 
             if f != old_f:
-                # Add the file to Sphinx build dependencies
-                env.note_dependency(os.path.abspath(f))
+                # Add the file to Sphinx build dependencies if the file exists
+                if os.path.isfile(f):
+                    env.note_dependency(os.path.abspath(f))
 
                 old_f = f
 
We get a quick build again:

    [OUTDATED]
    Added: set()
    Changed: {'gpio/index', 'gpio/obsolete'}
    Removed: set()
    All docs count: 385
    Found docs count: 385
    /root/Documentation/admin-guide/gpio/index.rst:7: WARNING: toctree contains reference to nonexisting document 'userspace-api/gpio/chardev' [toc.not_readable]
    /root/Documentation/admin-guide/gpio/obsolete.rst:7: WARNING: toctree contains reference to nonexisting document 'userspace-api/gpio/chardev_v1' [toc.not_readable]
    /root/Documentation/admin-guide/gpio/obsolete.rst:7: WARNING: toctree contains reference to nonexisting document 'userspace-api/gpio/sysfs' [toc.not_readable]
    make[1]: Leaving directory '/tmp/foo'

   real    0m1,444s
   user    0m1,267s
   sys     0m0,252s

However, that's because it won't add any dependency at all when
O= is used. The problem seems to be related to relative/absolute
patches when adding such dependencies.

Let me try to write a proper fix.

Jon,

Btw, should we add something like the code below to be optionally
used at conf.py when we need to identify cache issues?

Regards,
Mauro


---

This is what I added at the end of conf.py, at setup(app):

Thanks,
Mauro
