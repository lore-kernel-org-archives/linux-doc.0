Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21770C433ED
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 14:35:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E366C61176
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 14:35:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234787AbhEFOgG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 10:36:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:52712 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234694AbhEFOgF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 May 2021 10:36:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 4B31EAF4E;
        Thu,  6 May 2021 14:35:06 +0000 (UTC)
Date:   Thu, 6 May 2021 16:35:04 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210506143504.GG6564@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <20210506132006.22d97e04@coco.lan>
 <20210506133212.GF6564@kitsune.suse.cz>
 <20210506162442.7d118ac3@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210506162442.7d118ac3@coco.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 06, 2021 at 04:24:42PM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 6 May 2021 15:32:12 +0200
> Michal Suchánek <msuchanek@suse.de> escreveu:
> 
> > On Thu, May 06, 2021 at 01:20:06PM +0200, Mauro Carvalho Chehab wrote:
> > > Em Thu, 6 May 2021 12:39:13 +0200
> > > Michal Suchánek <msuchanek@suse.de> escreveu:
> > >   
> > > > When building HTML documentation I get this output:
> > > > 
> > > > [  120s] + make O=/home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/html PYTHON=python3 htmldocs
> > > > [  120s] make[1]: Entering directory '/home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/html'
> > > > [  120s] cat: /etc/os-release: No such file or directory
> > > > [  121s]   SPHINX  htmldocs --> file:///home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/html/Documentation/output
> > > > [  121s]   PARSE   include/uapi/linux/dvb/audio.h
> > > > [  121s]   PARSE   include/uapi/linux/dvb/ca.h
> > > > [  121s]   PARSE   include/uapi/linux/dvb/dmx.h
> > > > [  121s]   PARSE   include/uapi/linux/dvb/frontend.h
> > > > [  122s]   PARSE   include/uapi/linux/dvb/net.h
> > > > [  122s]   PARSE   include/uapi/linux/dvb/video.h
> > > > [  122s]   PARSE   include/uapi/linux/videodev2.h
> > > > [  122s]   PARSE   include/uapi/linux/media.h
> > > > [  122s]   PARSE   include/uapi/linux/cec.h
> > > > [  122s]   PARSE   include/uapi/linux/lirc.h
> > > > [  190s] ../include/linux/dcache.h:318: warning: expecting prototype for dget, dget_dlock(). Prototype was for dget_dlock() instead
> > > > [  203s] ../include/linux/regulator/driver.h:388: warning: Function parameter or member 'ramp_reg' not described in 'regulator_desc'
> > > > [  203s] ../include/linux/regulator/driver.h:388: warning: Function parameter or member 'ramp_mask' not described in 'regulator_desc'
> > > > [  203s] ../include/linux/regulator/driver.h:388: warning: Function parameter or member 'ramp_delay_table' not described in 'regulator_desc'
> > > > [  203s] ../include/linux/regulator/driver.h:388: warning: Function parameter or member 'n_ramp_values' not described in 'regulator_desc'
> > > > [  203s] ../include/linux/spi/spi.h:671: warning: Function parameter or member 'devm_allocated' not described in 'spi_controller'
> > > > [  203s] ../drivers/usb/dwc3/core.h:865: warning: Function parameter or member 'hwparams9' not described in 'dwc3_hwparams'
> > > > [  233s] ../drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2808: warning: Excess function parameter 'vm_context' description in 'amdgpu_vm_init'
> > > > [  233s] ../drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2808: warning: Excess function parameter 'vm_context' description in 'amdgpu_vm_init'
> > > > [  233s] ../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:426: warning: Function parameter or member 'disable_hpd_irq' not described in 'amdgpu_display_manager'
> > > > [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function parameter 'trampoline' description in 'intel_engine_cmd_parser'
> > > > [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or member 'jump_whitelist' not described in 'intel_engine_cmd_parser'
> > > > [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or member 'shadow_map' not described in 'intel_engine_cmd_parser'
> > > > [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Function parameter or member 'batch_map' not described in 'intel_engine_cmd_parser'
> > > > [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess function parameter 'trampoline' description in 'intel_engine_cmd_parser'
> > > > [  233s] ../drivers/gpu/host1x/bus.c:774: warning: Excess function parameter 'key' description in '__host1x_client_register'
> > > > [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/Documentation/ABI/testing/sysfs-platform-intel-pmc:2: WARNING: Definition list ends without a blank line; unexpected unindent.
> > > > [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/Documentation/driver-api/serial/index.rst:17: WARNING: toctree contains reference to nonexisting document 'driver-api/serial/rocket'
> > > > [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/Documentation/gpu/amdgpu:96: ../drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:323: WARNING: Unexpected indentation.
> > > > [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/Documentation/gpu/amdgpu:96: ../drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:324: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > > [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/Documentation/gpu/amdgpu:96: ../drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:327: WARNING: Definition list ends without a blank line; unexpected unindent.
> > > > [  307s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/Documentation/driver-api/usb/writing_usb_driver.rst:129: WARNING: undefined label: usb_header (if the link has no caption the label must precede a section header)
> > > > [  412s] 
> > > > [  412s] Sphinx parallel build error:
> > > > [  412s] UnicodeEncodeError: 'latin-1' codec can't encode characters in position 18-20: ordinal not in range(256)
> > > > [  431s] make[2]: *** [../Documentation/Makefile:91: htmldocs] Error 2
> > > > [  431s] make[1]: *** [/home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/Makefile:1784: htmldocs] Error 2
> > > > [  431s] make[1]: Leaving directory '/home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/html'
> > > > [  431s] make: *** [Makefile:222: __sub-make] Error 2
> > > > [  431s] error: Bad exit status from /var/tmp/rpm-tmp.npkyVx (%build)
> > > > 
> > > > It does not say which input file contains the offending character so I can't tell which file is broken.
> > > > 
> > > > Any idea how to debug?  
> > > 
> > > Yes. You probably has some weird file under Documentation/ABI.
> > > Some text editors like kate tend to keep temporary files sometimes.
> > > 
> > > The scripts/get_ABI.pl (currently) doesn't have any logic
> > > to recognize valid ABI files from trash stuff added at
> > > the ABI dirs.
> > > 
> > > Just doing a git status (or a git clean) and removing such
> > > files should fix the build.  
> > 
> > This is clean git-archived tarball uploaded to a build service so the
> > likehood of some garbage files popping out in Documentation/ABI out of
> > nowhere is quite small.
> 
> Well, it could be something completely different ;-) 
> 
> This crash happens when Sphinx/python finds a character it doesn't 
> recognize as valid, like if you run something like:
> 
> 	$ echo -en "What:\tBROKEN description\ndescription:\n";dd if=/dev/random count=10 ) > Documentation/ABI/testing/foobar
> 	$ ./scripts/get_abi.pl  rest 2>/dev/null|grep BROK
> 	Binary file (standard input) matches
> 
> On such case, non UTF-8 chars end being inserted, causing python and/or Sphinx
> exceptions, causing it to crash:
> 
> 	WARNING: The kernel documentation build process
> 	        support for Sphinx v3.0 and above is brand new. Be prepared for
> 	        possible issues in the generated output.
> 	enabling CJK for LaTeX builder
> 
> 	Sphinx parallel build error:
> 	UnicodeDecodeError: 'utf-8' codec can't decode byte 0xa8 in position 1985806: invalid start byte
> 	make[1]: *** [Documentation/Makefile:91: htmldocs] Error 2
> 	make: *** [Makefile:1790: htmldocs] Error 2
> 
> Yet, this sounds a weird to me:
> 
> 	UnicodeEncodeError: 'latin-1' 
> 
> It sounds that it is somehow trying to use latin-1 alphabet, instead of utf-8.

How does it determine what character set to use?

I suspect the limited build environment does not have locale files.

The build system locale is kind of irrelevant for the documentation
locale but if it creeps in because the input file locale is not
specified anywhere this can cause problems.

Thanks

Michal
