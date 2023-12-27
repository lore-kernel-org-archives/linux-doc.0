Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7952A446C1
	for <linux-doc@vger.kernel.org>; Wed, 27 Dec 2023 11:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VE7eXVxT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B059EC433C7;
	Wed, 27 Dec 2023 11:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703677329;
	bh=10tIoglNsPKvw7FCgvJqgQ4U1R8l2j7465yARBXbRr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VE7eXVxThckhRzspBXcbO66wffMDDXDdsaeb4knh/m4akdwa1hapLfSD5kQk+B/J3
	 DBAZPTO3/tvCOy9SBsr2bRlWQcbo/bBOIuMe1S7kACSAwwWw+efojISnopFWXv5KUD
	 lznmOHQ+doEAfm0TSJKp5by8tAaaov+LmAocp02pDesjgdMJfjxEM8ePJMtfZboKx3
	 MZEBKoIC8wZ3C31mbwmIoqF+YUDKYF9xpujJP92eFUUGHMzfp6i9NMdcE5UqRm9z0X
	 qG2+w37A0Rjl/rznl8WtnRvp6oioil0ZBBPfa5xYtqy4y7/DF++dfiERg79vjUg6o/
	 5TCXc6Fc+zfHA==
Date: Wed, 27 Dec 2023 12:42:04 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Vegard Nossum <vegard.nossum@oracle.com>, "
 =?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@protonmail.com>
Subject: Re: docs: automarkup.py
Message-ID: <20231227124204.640363d7@coco.lan>
In-Reply-To: <06a5efb9-df6f-4488-9ff9-ccee296d0351@infradead.org>
References: <06a5efb9-df6f-4488-9ff9-ccee296d0351@infradead.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 26 Dec 2023 23:55:26 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Hi,
> 
> Can anyone explain this?  maybe even suggest a fix for it?
> 
> This has been around for a few weeks AFAIK. I haven't see a patch for it,
> but I could have missed it.
> 
> (since 17e02586ed185 in August/2023; oh, that just fixed the move
> of files to the Documentation/arch/ subdir, so maybe even longer)
> 
> 
> In file Documentation/ABI/testing/sysfs-bus-papr-pmem:
> 
> 		response to H_SCM_HEALTH hcall. The details of the bit
> 		flags returned in response to this hcall is available
> 		at 'Documentation/arch/powerpc/papr_hcalls.rst'. Below are
> 		the flags reported in this sysfs file:
> 
> kernel-doc reports:
> 
> linux-next-20231222/Documentation/ABI/testing/sysfs-bus-papr-pmem:2: WARNING: unknown document: '/powerpc/papr_hcalls'
> 
> and the output file Documentation/output/admin-guide/abi-testing.html says:
> 
> response to H_SCM_HEALTH hcall. The details of the bit
> flags returned in response to this hcall is available
> at '<span class="xref std std-doc">/powerpc/papr_hcalls</span>' . Below are
> the flags reported in this sysfs file:</p>

With sphinx-build version 6.2.1 and latest linux-next, I'm getting:

<snip>
<p>Defined on file <a class="reference internal" href="#abi-file-testing-sysfs-bus-papr-pmem"><span class="std std-ref">sysfs-bus-papr-pmem</span></a></p>
<p>(RO) Report flags indicating various states of a
papr-pmem NVDIMM device. Each flag maps to a one or
more bits set in the dimm-health-bitmap retrieved in
response to H_SCM_HEALTH hcall. The details of the bit
flags returned in response to this hcall is available
at '<a class="reference internal" href="../arch/powerpc/papr_hcalls.html"><span class="doc">Hypercall Op-codes (hcalls)</span></a>' .
</snip>

It seems that references are properly evaluated there.

> so the leading "Documentation/arch" is being removed from the filename
> AFAICT.

Actually, this is not related to automarkup.py, but, instead to
get_abi automation. You can see how this is processed by running
get_abi.pl script, e. g.:

<snip>
$ ./scripts/get_abi.pl search nmemX/papr/flags

/sys/bus/nd/devices/nmemX/papr/flags
------------------------------------

Kernel version:		v5.8
Date:			Apr, 2020
Contact:		linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, nvdimm@lists.linux.dev,
Defined on file(s):	Documentation/ABI/testing/sysfs-bus-papr-pmem

Description:

(RO) Report flags indicating various states of a
papr-pmem NVDIMM device. Each flag maps to a one or
more bits set in the dimm-health-bitmap retrieved in
response to H_SCM_HEALTH hcall. The details of the bit
flags returned in response to this hcall is available
at 'Documentation/arch/powerpc/papr_hcalls.rst' . Below are
the flags reported in this sysfs file:

* "not_armed"
                  Indicates that NVDIMM contents will not
                  survive a power cycle.
* "flush_fail"
                  Indicates that NVDIMM contents
                  couldn't be flushed during last
                  shut-down event.
* "restore_fail"
                  Indicates that NVDIMM contents
                  couldn't be restored during NVDIMM
                  initialization.
* "encrypted"
                  NVDIMM contents are encrypted.
* "smart_notify"
                  There is health event for the NVDIMM.
* "scrubbed"
                  Indicating that contents of the
                  NVDIMM have been scrubbed.
* "locked"
                  Indicating that NVDIMM contents can't
                  be modified until next power cycle.
</snip>

The output there is not in ReST format. There is a "rest" parameter
to generate the version actually used by Sphinx.

When "./scripts/get_abi.pl rest" is used, it converts any reference
of Documentation/xxx.rst into[1]:

	:doc:`/xxx`

Which is actually a relative link, pointing to the file at:

	<doc_source_dir>/xxx.rst

The references there are relative to the doc root directory passed
to sphinx-build (Documentation/). So, the above shall create a
cross-reference to Documentation/xxx.rst using the document title as the
name of the reference, so this will become:

	<a class="reference internal" href="../arch/powerpc/papr_hcalls.html"><span class="doc">Hypercall Op-codes (hcalls)</span></a>

[1] see https://docs.readthedocs.io/en/stable/guides/cross-referencing-with-sphinx.html#the-doc-role

See how a similar link is converted to ReST format:

<snip>
$ ./scripts/get_abi.pl rest |grep -A20 /mte_tcf_preferred
Warning: file Documentation/ABI/testing/sysfs-platform-silicom#20:
	What '/sys/devices/platform/silicom-platform/power_cycle' doesn't have a description
| **\/sys\/devices\/system\/cpu\/cpuX\/mte_tcf_preferred** |
+----------------------------------------------------------+

Defined on file :ref:`sysfs-devices-system-cpu <abi_file_testing_sysfs_devices_system_cpu>`

Preferred MTE tag checking mode

When a user program specifies more than one MTE tag checking
mode, this sysfs node is used to specify which mode should
be preferred when scheduling a task on that CPU. Possible
values:

================  ==============================================
"sync"            Prefer synchronous mode
"asymm"           Prefer asymmetric mode
"async"           Prefer asynchronous mode
================  ==============================================

See also: :doc:`/arch/arm64/memory-tagging-extension`
<snip>

> I tried changing the quoted filename from single quotes to double back quotes
> `` and I tried it without any quotes, all with the same results.

With a quote like "`", the above would be evaluated to:
	
See also: `:doc:`/arch/arm64/memory-tagging-extension``

which will probably cause problems when sphinx parses it.

That's said, I remember that some old Sphinx versions had issues 
with the doc: tag. On some legacy versions, the <doc_source_dir>
is set in a wrong way, ignoring the path used at the sphinx-build
directory parameter.

Thanks,
Mauro
