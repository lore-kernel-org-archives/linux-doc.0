Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8057BC433ED
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 11:20:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E2D761157
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 11:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbhEFLVI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 07:21:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:36818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234589AbhEFLVI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 May 2021 07:21:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62ACC61168;
        Thu,  6 May 2021 11:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620300010;
        bh=Y8upb1SnRou62RCvq4toTlRXQ2cvCfh4g7LGWlaF67I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=s1GOUYEorQSgsqIzcpIu/aF5aF8s+yw9nOhIcPs15llRxYaEKQ8CjEOQu4bjyjRAF
         4MsW1uBPyGEgDwHj2+dL0RsUlFDbB8x+kF/dhb/liUyW4c4hurpi4Ekve690OJxB5H
         WPRZg0VUD/+clbghJi2RnH2TbhRRggLVgdRFfkdIo946w0OAO+WhEbZpIC5Zj7lnul
         5fu0Gl/6JliQegDk6kAoLHCjjuXYdnYyIE2YX4W/7xCLBvHYFK2uX/GaL0SFQE703x
         YPPDs8IWvK/U5je/s+Lr9VsxgCXp14iUBrn7XuzyLI2rvWoV+SgNSBF8LZuq9BK3Qx
         feDa2xHlttEyQ==
Date:   Thu, 6 May 2021 13:20:06 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1'
 codec can't encode characters in position 18-20: ordinal not in range(256)
Message-ID: <20210506132006.22d97e04@coco.lan>
In-Reply-To: <20210506103913.GE6564@kitsune.suse.cz>
References: <20210506103913.GE6564@kitsune.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 6 May 2021 12:39:13 +0200
Michal Such=C3=A1nek <msuchanek@suse.de> escreveu:

> When building HTML documentation I get this output:
>=20
> [  120s] + make O=3D/home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.2=
0210506/linux-5.12-next-20210506/html PYTHON=3Dpython3 htmldocs
> [  120s] make[1]: Entering directory '/home/abuild/rpmbuild/BUILD/kernel-=
docs-5.12.0.next.20210506/linux-5.12-next-20210506/html'
> [  120s] cat: /etc/os-release: No such file or directory
> [  121s]   SPHINX  htmldocs --> file:///home/abuild/rpmbuild/BUILD/kernel=
-docs-5.12.0.next.20210506/linux-5.12-next-20210506/html/Documentation/outp=
ut
> [  121s]   PARSE   include/uapi/linux/dvb/audio.h
> [  121s]   PARSE   include/uapi/linux/dvb/ca.h
> [  121s]   PARSE   include/uapi/linux/dvb/dmx.h
> [  121s]   PARSE   include/uapi/linux/dvb/frontend.h
> [  122s]   PARSE   include/uapi/linux/dvb/net.h
> [  122s]   PARSE   include/uapi/linux/dvb/video.h
> [  122s]   PARSE   include/uapi/linux/videodev2.h
> [  122s]   PARSE   include/uapi/linux/media.h
> [  122s]   PARSE   include/uapi/linux/cec.h
> [  122s]   PARSE   include/uapi/linux/lirc.h
> [  190s] ../include/linux/dcache.h:318: warning: expecting prototype for =
dget, dget_dlock(). Prototype was for dget_dlock() instead
> [  203s] ../include/linux/regulator/driver.h:388: warning: Function param=
eter or member 'ramp_reg' not described in 'regulator_desc'
> [  203s] ../include/linux/regulator/driver.h:388: warning: Function param=
eter or member 'ramp_mask' not described in 'regulator_desc'
> [  203s] ../include/linux/regulator/driver.h:388: warning: Function param=
eter or member 'ramp_delay_table' not described in 'regulator_desc'
> [  203s] ../include/linux/regulator/driver.h:388: warning: Function param=
eter or member 'n_ramp_values' not described in 'regulator_desc'
> [  203s] ../include/linux/spi/spi.h:671: warning: Function parameter or m=
ember 'devm_allocated' not described in 'spi_controller'
> [  203s] ../drivers/usb/dwc3/core.h:865: warning: Function parameter or m=
ember 'hwparams9' not described in 'dwc3_hwparams'
> [  233s] ../drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2808: warning: Excess =
function parameter 'vm_context' description in 'amdgpu_vm_init'
> [  233s] ../drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2808: warning: Excess =
function parameter 'vm_context' description in 'amdgpu_vm_init'
> [  233s] ../drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:426: warnin=
g: Function parameter or member 'disable_hpd_irq' not described in 'amdgpu_=
display_manager'
> [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess =
function parameter 'trampoline' description in 'intel_engine_cmd_parser'
> [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Functio=
n parameter or member 'jump_whitelist' not described in 'intel_engine_cmd_p=
arser'
> [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Functio=
n parameter or member 'shadow_map' not described in 'intel_engine_cmd_parse=
r'
> [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Functio=
n parameter or member 'batch_map' not described in 'intel_engine_cmd_parser'
> [  233s] ../drivers/gpu/drm/i915/i915_cmd_parser.c:1420: warning: Excess =
function parameter 'trampoline' description in 'intel_engine_cmd_parser'
> [  233s] ../drivers/gpu/host1x/bus.c:774: warning: Excess function parame=
ter 'key' description in '__host1x_client_register'
> [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/lin=
ux-5.12-next-20210506/Documentation/ABI/testing/sysfs-platform-intel-pmc:2:=
 WARNING: Definition list ends without a blank line; unexpected unindent.
> [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/lin=
ux-5.12-next-20210506/Documentation/driver-api/serial/index.rst:17: WARNING=
: toctree contains reference to nonexisting document 'driver-api/serial/roc=
ket'
> [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/lin=
ux-5.12-next-20210506/Documentation/gpu/amdgpu:96: ../drivers/gpu/drm/amd/a=
mdgpu/amdgpu_ras.c:323: WARNING: Unexpected indentation.
> [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/lin=
ux-5.12-next-20210506/Documentation/gpu/amdgpu:96: ../drivers/gpu/drm/amd/a=
mdgpu/amdgpu_ras.c:324: WARNING: Block quote ends without a blank line; une=
xpected unindent.
> [  234s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/lin=
ux-5.12-next-20210506/Documentation/gpu/amdgpu:96: ../drivers/gpu/drm/amd/a=
mdgpu/amdgpu_ras.c:327: WARNING: Definition list ends without a blank line;=
 unexpected unindent.
> [  307s] /home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.next.20210506/lin=
ux-5.12-next-20210506/Documentation/driver-api/usb/writing_usb_driver.rst:1=
29: WARNING: undefined label: usb_header (if the link has no caption the la=
bel must precede a section header)
> [  412s]=20
> [  412s] Sphinx parallel build error:
> [  412s] UnicodeEncodeError: 'latin-1' codec can't encode characters in p=
osition 18-20: ordinal not in range(256)
> [  431s] make[2]: *** [../Documentation/Makefile:91: htmldocs] Error 2
> [  431s] make[1]: *** [/home/abuild/rpmbuild/BUILD/kernel-docs-5.12.0.nex=
t.20210506/linux-5.12-next-20210506/Makefile:1784: htmldocs] Error 2
> [  431s] make[1]: Leaving directory '/home/abuild/rpmbuild/BUILD/kernel-d=
ocs-5.12.0.next.20210506/linux-5.12-next-20210506/html'
> [  431s] make: *** [Makefile:222: __sub-make] Error 2
> [  431s] error: Bad exit status from /var/tmp/rpm-tmp.npkyVx (%build)
>=20
> It does not say which input file contains the offending character so I ca=
n't tell which file is broken.
>=20
> Any idea how to debug?

Yes. You probably has some weird file under Documentation/ABI.
Some text editors like kate tend to keep temporary files sometimes.

The scripts/get_ABI.pl (currently) doesn't have any logic
to recognize valid ABI files from trash stuff added at
the ABI dirs.

Just doing a git status (or a git clean) and removing such
files should fix the build.

Regards,
Mauro
