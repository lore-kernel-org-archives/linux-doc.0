Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A13714AD0D
	for <linux-doc@vger.kernel.org>; Sat,  4 Oct 2025 02:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759545471; cv=none; b=hXj2uyVBNzRISRDKqqsxI3Kq4WoygwZauBA3/TKdgNfEZHVgc/Pi+S9fwxBwcyZh/zqjILYJ+URdCciLpVsN7nBbY6ZspFP1MgZQRjFG3cXeBDuIf4+9h/fhekrIvklAT+bFRqt7r/WOG8zRJwqlbcrqnf8gpjG80iJIAzQ/11E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759545471; c=relaxed/simple;
	bh=z8FEWYioRZsia1D0UVZElrLnWOE6tccgR6dAs9tkFMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DekKUzeV28hGS9s3sbWHJXjtbbuUvJPOvt+Cs48aC2HFMNPfGtIv4sMyOvMGe578t8p5f5PmHngWi2Nx+8ARsnH+x/k+PqAEM2QPUWHjWD8ez6r7UZelbYXwe2AnugyO7jT0HIdIA7tBIE+hae9av0JVixk9AUNqg9QMxMDVoQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=GyM7ZH9q; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="GyM7ZH9q"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-816ac9f9507so433006985a.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 19:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759545467; x=1760150267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WX2AvTRjoMsNn7rSSXm6NpMJfKCTCSB0TADy4mhOSmg=;
        b=GyM7ZH9qwtF2cHGRWxs17OA2fPZjLHFBhSh3a6J52ZHrLJYQncuHmqlhKTWNAUe3YN
         DQNFHE4zxiiL7GXAu0utoiuL7orUv2aAYNCcQoF2k8sTlIXU2kwGSpW2R/y+/gu3TaAj
         Kk2Kuj0IWw9Waz6GfsBxk5Dtl5JTYcmvdcqDrLAq8p/jaF+bLVxvoBtO9gB2kOWoIm2v
         gI3Evie6M5MRI/mBzItMGa2/5srVpYDyDAYeU4k3/Ng8gEHKV/63WlBtRa4qXNJqL4dk
         cVRn4dmTwTKgtPk6W7Rl9eQHIazyLY8qdwx1Bim0x+dqcl896qSZP5K7qL7k5h3RSvUF
         OrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759545467; x=1760150267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WX2AvTRjoMsNn7rSSXm6NpMJfKCTCSB0TADy4mhOSmg=;
        b=kp7LvpljUxA8DKQhTELhXnU7ggAXXqJiymca+5E9Nv2epvERc87t0dmE5QmOHywOW7
         z52CV0iKGSOJirtq25E2n4gkiDT4uWYaswXuNM6+kBRzlGLj44UqYt+3OFYiM7wF+Wp0
         Z+kqBRlcRm7SDs7rFS5KMpXYVGVYkB7oI4W3fvhgTsK6kfIMb6ObZ0LpQG1jxfjkNgMb
         Vk8Bz5nAw+7F0JjpGZNv/YVBtf6o81pFbqqPivFW+K2szo5n+6Zq0gKgrwinoRBzSbW0
         OhAubaE1kU5GeDKGMNssBwayHW87gesz0hqCVgAT0Ii1swP/p/5hRCIfYquwD3ce2rOP
         kZfw==
X-Forwarded-Encrypted: i=1; AJvYcCW0T5+mRLnrCJK0+EXRMmbl9wwEpN5kaRmzrit7Ptf0V+HQLi6CHzBisUzRXK9W5/WGXG/vCdNWKWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya9w0iB84HM1sVX1js1Kg7LDA9bVDS4M/4jEd3Tf/El6pru42H
	cLln0EVk8UlzsfItBNlDr3jCmaQjTqOedFZbbjtWc4f2TgTv7zrtPz3gNSV6I2uUZ0vbXNyk7RE
	5fZpGh5I2eTgftmPE385B7Gl9xtjqobx78J/X0LsYoA==
X-Gm-Gg: ASbGncu2uCbI6kkNnEA+h58H+XH+J4A2y9kPr5rPbmF72w8u0+pcxM/DegsJ13zUNJ4
	YcHGbzW5aOo5rHz0nqz4fwhDIYCMZ6kWDWq7Femgar9aT9Utnxd1LIvzaA49oZL0k7mzRBqjQxG
	h049Jfc8qylLs5zh9BNKN7NfL3CC6GNeOGNf/rjJnElNSRYQ2L1pL0MIcEHVI6VOasnup4qjgFa
	XDcacenWsMqfO8gK/Mr1AysV66L
X-Google-Smtp-Source: AGHT+IHpXmfwm/zD9D+zvb53ixNC14PQWRGIATDbgGewBobYXO/nEIYfu9ZMcBO3awLQMttSyQvIKLOwmKCMpwF49ms=
X-Received: by 2002:a05:620a:1a0e:b0:828:804a:47f2 with SMTP id
 af79cd13be357-87a32af5f30mr715143885a.9.1759545467113; Fri, 03 Oct 2025
 19:37:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
 <20250929010321.3462457-27-pasha.tatashin@soleen.com> <20251003225120.GA2035091.vipinsh@google.com>
 <CA+CK2bBuO5YaL8MNqb5Xo_us600vTe2SF_yMNU-O9D2_RBoMag@mail.gmail.com>
In-Reply-To: <CA+CK2bBuO5YaL8MNqb5Xo_us600vTe2SF_yMNU-O9D2_RBoMag@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 3 Oct 2025 22:37:10 -0400
X-Gm-Features: AS18NWAFqUB-LYy2SykxO160YAKxge0tVD8HRG9MgImFDuYaat9DVXaJFYTvN7M
Message-ID: <CA+CK2bBSObHG=9Rj623mahyhE81DhhKbN09aHS96p==8y_mCGw@mail.gmail.com>
Subject: Re: [PATCH v4 26/30] selftests/liveupdate: Add multi-kexec session
 lifecycle test
To: Vipin Sharma <vipinsh@google.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org, steven.sistare@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 10:07=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On Fri, Oct 3, 2025 at 6:51=E2=80=AFPM Vipin Sharma <vipinsh@google.com> =
wrote:
> >
> > On 2025-09-29 01:03:17, Pasha Tatashin wrote:
> > > diff --git a/tools/testing/selftests/liveupdate/.gitignore b/tools/te=
sting/selftests/liveupdate/.gitignore
> > > index af6e773cf98f..de7ca45d3892 100644
> > > --- a/tools/testing/selftests/liveupdate/.gitignore
> > > +++ b/tools/testing/selftests/liveupdate/.gitignore
> > > @@ -1 +1,2 @@
> > >  /liveupdate
> > > +/luo_multi_kexec
> >
> > In next patches new tests are not added to gitignore.
>
> Will fix it, thanks.
>
> >
> > > diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/test=
ing/selftests/liveupdate/Makefile
> > > index 2a573c36016e..1cbc816ed5c5 100644
> > > --- a/tools/testing/selftests/liveupdate/Makefile
> > > +++ b/tools/testing/selftests/liveupdate/Makefile
> > > @@ -1,7 +1,38 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > > +
> > > +KHDR_INCLUDES ?=3D -I../../../usr/include
> >
> > If make is run from the tools/testing/selftests/liveupdate directory, t=
his
> > will not work because it needs one more "..".
> >
> > If this is built using selftest Makefile from root directory
> >
> >   make -C tools/testing/selftests TARGETS=3Dliveupdate
> >
> > there will not be build errors because tools/testing/selftests/Makefile
> > defines KHDR_INCLUDES, so above definition will never happen.
> >
> > >  CFLAGS +=3D -Wall -O2 -Wno-unused-function
> > >  CFLAGS +=3D $(KHDR_INCLUDES)
> > > +LDFLAGS +=3D -static
> >
> > Why static? Can't we let user pass extra flags if they prefer static
>
> Because these tests are executed in a VM and not on the host, static
> makes sense to be able to run in a different environment.
>
> > > +
> > > +# --- Test Configuration (Edit this section when adding new tests) -=
--
> > > +LUO_SHARED_SRCS :=3D luo_test_utils.c
> > > +LUO_SHARED_HDRS +=3D luo_test_utils.h
> > > +
> > > +LUO_MANUAL_TESTS +=3D luo_multi_kexec
> > > +
> > > +TEST_FILES +=3D do_kexec.sh
> > >
> > >  TEST_GEN_PROGS +=3D liveupdate
> > >
> > > +# --- Automatic Rule Generation (Do not edit below) ---
> > > +
> > > +TEST_GEN_PROGS_EXTENDED +=3D $(LUO_MANUAL_TESTS)
> > > +
> > > +# Define the full list of sources for each manual test.
> > > +$(foreach test,$(LUO_MANUAL_TESTS), \
> > > +     $(eval $(test)_SOURCES :=3D $(test).c $(LUO_SHARED_SRCS)))
> > > +
> > > +# This loop automatically generates an explicit build rule for each =
manual test.
> > > +# It includes dependencies on the shared headers and makes the outpu=
t
> > > +# executable.
> > > +# Note the use of '$$' to escape automatic variables for the 'eval' =
command.
> > > +$(foreach test,$(LUO_MANUAL_TESTS), \
> > > +     $(eval $(OUTPUT)/$(test): $($(test)_SOURCES) $(LUO_SHARED_HDRS)=
 \
> > > +             $(call msg,LINK,,$$@) ; \
> > > +             $(Q)$(LINK.c) $$^ $(LDLIBS) -o $$@ ; \
> > > +             $(Q)chmod +x $$@ \
> > > +     ) \
> > > +)
> > > +
> > >  include ../lib.mk
> >
> > make is not building LUO_MANUAL_TESTS, it is only building liveupdate.
> > How to build them?
>
> I am building them out of tree:
> make O=3Dx86_64 -s -C tools/testing/selftests TARGETS=3Dliveupdate instal=
l
> make O=3Dx86_64 -s -C tools/testing/selftests TARGETS=3Dkho install

Actually, I just tested in-tree and everything works for me, could you
please verify:

make mrproper  # Clean the tree
cat tools/testing/selftests/liveupdate/config > .config # Copy LUO depends.
make olddefconfig  # make a def config with LUO
make kvm_guest.config # Build minimal KVM guest with LUO
make headers # Make uAPI headers
make -C tools/testing/selftests TARGETS=3Dliveupdate install # make and
install liveupdate selftests

# Show that self tests are properly installed:
ls -1 tools/testing/selftests/kselftest_install/liveupdate/
config
do_kexec.sh
liveupdate
luo_multi_file
luo_multi_kexec
luo_multi_session
luo_unreclaimed

Pasha
