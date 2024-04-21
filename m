Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D94338C
	for <linux-doc@vger.kernel.org>; Sun, 21 Apr 2024 01:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713663368; cv=none; b=I6Ybbc8XLotKL8t604+dDMvhqHNTMHqw1i3nFWFcRtSM4EV0M2ghcCaY3+qes2ZDRyv/LzwUKtrjqYYGgPkTLNA1XVW1uDM+bXQhjKeveNjS1dMNQJYh3VyE6sxtEWxgKeZKshHE+8+RRC2y3rNSkXodKGc5FIw2BpOLu4xTR9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713663368; c=relaxed/simple;
	bh=cjl45f3HIIUgSfHXwpatp3AwqL5E+LRpwK6SKv3VcUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzK8vHPQeMkc+/IE0To3BFyxMx6L6j8SU6kI0un5eFFnBa3lgaXrhBsWZ8UAyq141GQpBMa2Z8h6y249Y3cWyk6YvXKLTvgZh2y+Wz1iy39x6jzj6tvWFZcytSwn4LT/oP47DZ5BonlJzKDWHR4nx9MoClyDIHV40fTYRUhYGiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jilL7mmq; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jilL7mmq"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c70999ff96so2277233b6e.2
        for <linux-doc@vger.kernel.org>; Sat, 20 Apr 2024 18:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713663365; x=1714268165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvPFBsNaoZ1H9tXzQ7l5Efl5qiniTP5oTQ2Kk1YN9Z4=;
        b=jilL7mmqC3EYj+pW7Fn2jntx0hNqtkB29Otmgj4S0nvnWgvP+wfUGtzhsfLzijo7D4
         Z4fmus1TwF4HD4eVH0P+lFAXaz1plXMq/eRjKSJBNWVcrpuEyJJ6mF7XFDls6UsPQ0jl
         +0jlkpd8PMxc2A+sW11IzlbinQ+Nxf71Mzd+eNwUQmvuE5Bz6p0N+YlM+kmypfXEIAUB
         vr5fzjSUFC+ww08fWSxYBceFwdmw0lInwIYqS0I++HJxDduBEb+nrB3dh6SxB2WHC0cs
         dcvRDks/BJRo6zeNifCfCpaTaATjdLbeCzFty8aMYLffm2eCyQmQxy4OdsU1FMd9+kdl
         TVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713663365; x=1714268165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvPFBsNaoZ1H9tXzQ7l5Efl5qiniTP5oTQ2Kk1YN9Z4=;
        b=RQ50BW/uCBBGbbdYXhqE4ZE4wswcCscYXoRrQoiDzVDzT5ibDnRCh4O/fATT6DoK41
         tZ2C5jahinlyrLDmP0g8HEHx5VdQOZHn6UvnS1ZvjHJH/CFH5JwaVV9vUnq1IE4DfT+H
         E4azUdTDwn6W5FSXXGfkA7EXlymTv5Tsdi6tk0Wgt1lJ+GIlyHb/s9bM+k4StxhKqYxm
         3Tz+ejLiRBoQWDegDucg9f/e1gKhUTwmsKd6pJ9Tgmwyj2PhekSw7tMogYNWNl4lk8FK
         +WkdUbezLuknXQAlh55vZEWOeHS+LvJsV0/R5zllCLbmEqk2e84IyOMl4a4GyoyFIR4i
         Ebgg==
X-Forwarded-Encrypted: i=1; AJvYcCWse5buGRhjfZptj16YXNiVoT1BoJQ18I7RPGfnXOpXlQRPAmq9mb08XVMQt6fsApXizXgPSz5p/BXsKH94Xnz/AoTD/pjCZMpV
X-Gm-Message-State: AOJu0YyroI2BqFmCVteF/0fMX0sfnLpxJGWSxn8DwxIU8quoIMp9YEDH
	w0RohQf0/OD0kJDoNqdEIvxRy40it1N34HRsPQVI1e8fOxitBpSO7fHzKSkmjqgYRrPR+B6L8sW
	pX0q/Thk8RYZ4lymseyn9mZaUYLk=
X-Google-Smtp-Source: AGHT+IFkyNsm4CrTyqXtqeNnnXaWtM3d85vgw+7Flih8SIL+lQ+nvAR4sw2pWcV0cfw8r5+XjtFntMOiXCgwJhS8K+c=
X-Received: by 2002:a05:6808:1a8f:b0:3c6:f7b1:b228 with SMTP id
 bm15-20020a0568081a8f00b003c6f7b1b228mr5853968oib.31.1713663365360; Sat, 20
 Apr 2024 18:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222155811.44096-1-Rodrigo.Siqueira@amd.com> <20240420184929.97854-1-jppaulo11@usp.br>
In-Reply-To: <20240420184929.97854-1-jppaulo11@usp.br>
From: Tales <tales.aparecida@gmail.com>
Date: Sat, 20 Apr 2024 22:36:58 -0300
Message-ID: <CAGVoLp5W0DT-RZbUvjoh6+=oNAi6A9V3P2syBMMVPXtiUY9K0A@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/amd/display: Update Display Core unit tests
To: Joao Paulo Pereira da Silva <jppaulo11@usp.br>
Cc: rodrigo.siqueira@amd.com, airlied@gmail.com, alexander.deucher@amd.com, 
	christian.koenig@amd.com, corbet@lwn.net, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	Xinhui.Pan@amd.com, paulormm@ime.usp.br, airlied@linux.ie, 
	amd-gfx@lists.freedesktop.org, andrealmeid@riseup.net, davidgow@google.com, 
	dlatypov@google.com, dri-devel@lists.freedesktop.org, harry.wentland@amd.com, 
	hersenxs.wu@amd.com, isabbasso@riseup.net, javierm@redhat.com, 
	kunit-dev@googlegroups.com, magalilemes00@gmail.com, mairacanal@riseup.net, 
	mwen@igalia.com, nicholas.choi@amd.com, sunpeng.li@amd.com, 
	twoerner@gmail.com, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em s=C3=A1b., 20 de abr. de 2024 =C3=A0s 15:50, Joao Paulo Pereira da Silva
<jppaulo11@usp.br> escreveu:
>
> Hey, I'm interested in contributing for display tests from this patch-set=
.
> I've noticed potential updates related to both refactoring and optimizati=
on.
> This patch-set applies these suggestions.
>

Hi,

It's great to see this moving forward!

Overall the suggested changes make sense to me, and honestly I already don'=
t
remember the discussions that went behind some of them. The only thing that
I would like to raise for you, and anyone else reviewing this, is that
apparently
there are now stronger feeling towards the "preferred way"[1] to handle tes=
ts in
static functions, using EXPORT_SYMBOL_IF_KUNIT (or EXPORT_SYMBOL_FOR_TESTS_=
ONLY
in the case of DRM), so they might be more adequate to work on
refactoring this code.

[1]: https://lore.kernel.org/all/5z66ivuhfrzrnuzt6lwjfm5fuozxlgqsco3qb5rfzy=
f6mil5ms@2svqtlcncyjj/

Kind regards,
Tales

>
> [WHY]
>
> 1.      The single test suite in the file
>         test/kunit/dc/dml/calcs/bw_fixed_test.c, which tests some static
>         functions defined in the dc/basics/bpw_fixed.c, is not being run.
>         According to kunit documentation
>         (https://www.kernel.org/doc/html/latest/dev-tools/kunit/usage.htm=
l#testing-static-functions),
>         there are two strategies for testing
>         static functions, but none of them seem to be configured. Additio=
nally,
>         it appears that the Config DCE_KUNIT_TEST should be associated wi=
th this
>         test, since it was introduced in the same patch of the test
>         (https://lore.kernel.org/amd-gfx/20240222155811.44096-3-Rodrigo.S=
iqueira@amd.com/),
>         but it is not being used anywhere in the display driver.
>
> 2.      Also, according to the documentation, "The display/tests folder r=
eplicates
>         the folder hierarchy of the display folder". However, note that t=
his test file
>         (test/kunit/dc/dml/calcs/bw_fixed_test.c) has a conflicting path =
with the file
>         that is being tested (dc/basics/bw_fixed.c).
>
> 3.      Config Names and Helps are a bit misleading and don't follow a st=
rict
>         pattern. For example, the config DML_KUNIT_TEST indicates that it=
 is used
>         to activate tests for the Display Core Engine, but instead activa=
tes tests
>         for the Display Core Next. Also, note the different name patterns=
 in
>         DML_KUNIT_TEST and AMD_DC_BASICS_KUNIT_TEST.
>
> 4.      The test suite dcn21_update_bw_bounding_box_test_suite configures=
 an init
>         function that doesn't need to be executed before every test, but =
only once
>         before the suite runs.
>
> 5.      There are some not updated info in the Documentation, such as the
>         recommended command to run the tests:
>         $ ./tools/testing/kunit/kunit.py run --arch=3Dx86_64 \
>         --kunitconfig=3Ddrivers/gpu/drm/amd/display/tests
>         (it doesn't work since there is no .kunitconfig in
>         drivers/gpu/drm/amd/display/tests)
>
>
> [HOW]
>
> 1. Revise Config names and Help blocks.
>
> 2.      Change the path of the test file bw_fixed_test from
>         test/kunit/dc/dml/calcs/bw_fixed_test.c to test/kunit/dc/basics/b=
w_fixed_test.c
>         to make it consistent with the Documentation and the other displa=
y driver
>         tests. Make this same test file run by importing it conditionally=
 in the file
>         dc/basics/bw_fixed_test.c.
>
> 3.      Turn the test init function of the suite
>         dcn21_update_bw_bounding_box_test_suite into a suite init.
>
> 4.      Update Documentation
>
> Joao Paulo Pereira da Silva (4):
>   drm/amd/display: Refactor AMD display KUnit tests configs
>   drm/amd/display/test: Fix kunit test that is not running
>   drm/amd/display/test: Optimize kunit test suite
>     dml_dcn20_fpu_dcn21_update_bw_bounding_box_test
>   Documentation/gpu: Update AMD Display Core Unit Test documentation
>
>  .../gpu/amdgpu/display/display-test.rst       | 20 ++++++------
>  drivers/gpu/drm/amd/display/Kconfig           | 31 ++++++-------------
>  .../gpu/drm/amd/display/dc/basics/bw_fixed.c  |  3 ++
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  2 +-
>  .../dc/dml/dcn20/display_mode_vba_20.c        |  2 +-
>  .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |  2 +-
>  .../drm/amd/display/test/kunit/.kunitconfig   |  7 ++---
>  .../gpu/drm/amd/display/test/kunit/Makefile   |  4 +--
>  .../dc/{dml/calcs =3D> basics}/bw_fixed_test.c  |  0
>  .../test/kunit/dc/dml/dcn20/dcn20_fpu_test.c  |  6 ++--
>  10 files changed, 32 insertions(+), 45 deletions(-)
>  rename drivers/gpu/drm/amd/display/test/kunit/dc/{dml/calcs =3D> basics}=
/bw_fixed_test.c (100%)
>
> --
> 2.44.0
>
