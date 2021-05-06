Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24806C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 14:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC6B36121F
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 14:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbhEFOZo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 10:25:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:53820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234790AbhEFOZo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 May 2021 10:25:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D29126113E;
        Thu,  6 May 2021 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620311085;
        bh=mjl+w3PyMXwPdj0KjeKDRBEuLy/LC5Gk7OaTblmhJO0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jy8rNcod3vDDkEYgXarg5QPByQNEmOAsjPCLKukrl+JpSeFdoAAAxbw2vuyEUPwXI
         pvO4K9NBuuRPndZLD3wvr435Z6qlzH9pRMtJP1vYBUFWGrpFZDLPFEMjmDiiFlIgV4
         aL/xxvSlwhXHOW8fQ6nDbp0bJxmvLIaDxsiqAPhcwCeBAWA+sDSUfq8AkrXyqeSJCL
         iub8DGuaEcgC6Q6LjCQ6doBU/VRmm1ARiea245NIeFUNhg06djYhXUQY+wlaF6Lg3+
         5+PEReSC1ptpKA4IOkNWR/sN+ZebSy0/B+cYRDRwquBpSvFwrIxPlK1xwLp1SxLQud
         qGkwqJURquJXA==
Date:   Thu, 6 May 2021 16:24:42 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210506162442.7d118ac3@coco.lan>
In-Reply-To: <20210506133212.GF6564@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
        <20210506132006.22d97e04@coco.lan>
        <20210506133212.GF6564@kitsune.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 6 May 2021 15:32:12 +0200
Michal Such=C3=A1nek <msuchanek@suse.de> escreveu:

> On Thu, May 06, 2021 at 01:20:06PM +0200, Mauro Carvalho Chehab wrote:
> > Em Thu, 6 May 2021 12:39:13 +0200
> > Michal Such=C3=A1nek <msuchanek@suse.de> escreveu:
> >  =20
> > > When building HTML documentation I get this output:
> > >=20
> > > [  120s] + make O=3D/home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.ne=
xt.20210506/linux-5.12-next-20210506/html PYTHON=3Dpython3 htmldocs
> > > [  120s] make[1]: Entering directory '/home/abuild/rpmbuild/BUILD/ker=
nel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/html'
> > > [  120s] cat: /etc/os-release: No such file or directory
> > > [  121s]   SPHINX  htmldocs --> file:///home/abuild/rpmbuild/BUILD/ke=
rnel-docs-5.12.0.next.20210506/linux-5.12-next-20210506/html/Documentation/=
output
> > > [  121s]   PARSE   include/uapi/linux/dvb/audio.h
> > > [  121s]   PARSE   include/uapi/linux/dvb/ca.h
> > > [  121s]   PARSE   include/uapi/linux/dvb/dmx.h
> > > [  121s]   PARSE   include/uapi/linux/dvb/frontend.h
> > > [  122s]   PARSE   include/uapi/linux/dvb/net.h
> > > [  122s]   PARSE   include/uapi/linux/dvb/video.h
> > > [  122s]   PARSE   include/uapi/linux/videodev2.h
> > > [  122s]   PARSE   include/uapi/linux/media.h
> > > [  122s]   PARSE   include/uapi/linux/cec.h
> > > [  122s]   PARSE   include/uapi/linux/lirc.h
> > > [  190s] ../include/linux/dcache.h:318: warning: expecting prototype =
for dget, dget_dlock(). Prototype was for dget_dlock() instead
> > > [  203s] ../include/linux/regulator/driver.h:388: warning: Function p=
arameter or member 'ramp_reg' not described in 'regulator_desc'
> > > [  203s] ../include/linux/regulator/driver.h:388: warning: Function p=
arameter or member 'ramp_mask' not described in 'regulator_desc'
> > > [  203s] ../include/linux/regulator/driver.h:388: warning: Function p=
arameter or member 'ramp_delay_table' not described in 'regulator_desc'
> > > [  203s] ../include/linux/regulator/driver.h:388: warning: Function p=
arameter or member 'n_ramp_values' not described in 'regulator_desc'
> > > [  203s] ../include/linux/spi/spi.h:671: warning: Function parameter =
or member 'devm_allocated' not described in 'spi_controller'
> > > [  203s] ../drivers/usb/dwc3/core.h:865: warning: Function parameter =
or member 'hwparams9' not described in 'dwc3_hwparams'
> > > [  233s] ../drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2808: warning: Exc=
ess function parameter 'vm_context' description in 'amdgpu_vm_init'
> > > [  233s] ../drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2808: warning: Exc=
ess function parameter 'vm_context' description in 'amdgpu_vm_init'
> > > [  233s] ../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:426: wa=
rning: Function parameter or member 'disable_hpd_irq' not described in 'amd=
gpu_display_manager'
> > > [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Exc=
ess function parameter 'trampoline' description in 'intel_engine_cmd_parser'
> > > [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Fun=
ction parameter or member 'jump_whitelist' not described in 'intel_engine_c=
md_parser'
> > > [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Fun=
ction parameter or member 'shadow_map' not described in 'intel_engine_cmd_p=
arser'
> > > [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Fun=
ction parameter or member 'batch_map' not described in 'intel_engine_cmd_pa=
rser'
> > > [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Exc=
ess function parameter 'trampoline' description in 'intel_engine_cmd_parser'
> > > [  233s] ../drivers/gpu/host1x/bus.c:774: warning: Excess function pa=
rameter 'key' description in '__host1x_client_register'
> > > [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506=
/linux-5.12-next-20210506/Documentation/ABI/testing/sysfs-platform-intel-pm=
c:2: WARNING: Definition list ends without a blank line; unexpected uninden=
t.
> > > [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506=
/linux-5.12-next-20210506/Documentation/driver-api/serial/index.rst:17: WAR=
NING: toctree contains reference to nonexisting document 'driver-api/serial=
/rocket'
> > > [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506=
/linux-5.12-next-20210506/Documentation/gpu/amdgpu:96: ../drivers/gpu/drm/a=
md/amdgpu/amdgpu_ras.c:323: WARNING: Unexpected indentation.
> > > [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506=
/linux-5.12-next-20210506/Documentation/gpu/amdgpu:96: ../drivers/gpu/drm/a=
md/amdgpu/amdgpu_ras.c:324: WARNING: Block quote ends without a blank line;=
 unexpected unindent.
> > > [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506=
/linux-5.12-next-20210506/Documentation/gpu/amdgpu:96: ../drivers/gpu/drm/a=
md/amdgpu/amdgpu_ras.c:327: WARNING: Definition list ends without a blank l=
ine; unexpected unindent.
> > > [  307s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506=
/linux-5.12-next-20210506/Documentation/driver-api/usb/writing_usb_driver.r=
st:129: WARNING: undefined label: usb_header (if the link has no caption th=
e label must precede a section header)
> > > [  412s]=20
> > > [  412s] Sphinx parallel build error:
> > > [  412s] UnicodeEncodeError: 'latin-1' codec can't encode characters =
in position 18-20: ordinal not in range(256)
> > > [  431s] make[2]: *** [../Documentation/Makefile:91: htmldocs] Error 2
> > > [  431s] make[1]: *** [/home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0=
.next.20210506/linux-5.12-next-20210506/Makefile:1784: htmldocs] Error 2
> > > [  431s] make[1]: Leaving directory '/home/abuild/rpmbuild/BUILD/kern=
el-docs-5.12.0.next.20210506/linux-5.12-next-20210506/html'
> > > [  431s] make: *** [Makefile:222: __sub-make] Error 2
> > > [  431s] error: Bad exit status from /var/tmp/rpm-tmp.npkyVx (%build)
> > >=20
> > > It does not say which input file contains the offending character so =
I can't tell which file is broken.
> > >=20
> > > Any idea how to debug? =20
> >=20
> > Yes. You probably has some weird file under Documentation/ABI.
> > Some text editors like kate tend to keep temporary files sometimes.
> >=20
> > The scripts/get_ABI.pl (currently) doesn't have any logic
> > to recognize valid ABI files from trash stuff added at
> > the ABI dirs.
> >=20
> > Just doing a git status (or a git clean) and removing such
> > files should fix the build. =20
>=20
> This is clean git-archived tarball uploaded to a build service so the
> likehood of some garbage files popping out in Documentation/ABI out of
> nowhere is quite small.

Well, it could be something completely different ;-)=20

This crash happens when Sphinx/python finds a character it doesn't=20
recognize as valid, like if you run something like:

	$ echo -en "What:\tBROKEN description\ndescription:\n";dd if=3D/dev/random=
 count=3D10 ) > Documentation/ABI/testing/foobar
	$ ./scripts/get_abi.pl  rest 2>/dev/null|grep BROK
	Binary file (standard input) matches

On such case, non UTF-8 chars end being inserted, causing python and/or Sph=
inx
exceptions, causing it to crash:

	WARNING: The kernel documentation build process
	        support for Sphinx v3.0 and above is brand new. Be prepared for
	        possible issues in the generated output.
	enabling CJK for LaTeX builder

	Sphinx parallel build error:
	UnicodeDecodeError: 'utf-8' codec can't decode byte 0xa8 in position 19858=
06: invalid start byte
	make[1]: *** [Documentation/Makefile:91: htmldocs] Error 2
	make: *** [Makefile:1790: htmldocs] Error 2

Yet, this sounds a weird to me:

	UnicodeEncodeError: 'latin-1'=20

It sounds that it is somehow trying to use latin-1 alphabet, instead of utf=
-8.

This will certainly cause troubles, as there are non-latin-1 characters
at the docs (specially at Japanese and Chinese translations, but there
are also a few utf-8 graphic symbols somewhere else).

I remember there were a change in the past that made utf-8 to be default
for Sphinx, but can't remember the details.

Thanks,
Mauro
