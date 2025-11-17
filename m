Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A09E30F95E
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 20:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763410127; cv=none; b=FbNX8+UQfSp2Qy0l2zi1jCzrDRuxtPYZigp3jTcgKeTof0eVsguB/dOb7CvtB76SoPpga/Cay4Tph5eoAD0C0lzXFLkwHKi2J3yIzVxrlwba4wtZqFAH3uPoA9AVRFVSgP0IIf4orJ8z1AraE9g0Y7epWEz+fqVQZ+xXK04lJck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763410127; c=relaxed/simple;
	bh=Yw1aZQl8vl8/93QETkjfeEjlH/aNdRcNmurvSzAuBsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bActRrfgkq2nQeb+EX71SwB03Ss51iQGOngytRN1e88MnCNH6+k4PXpDn0+LMCDlpuapnYxyke6TYJJHbEbpsOShLTse3LxmSRiinrofMRTkD2Pd2DJN6TEjBglEgZRY8ho6oqg0XDq/wQY3Rm2piQmdU4AjnPRCmbTC5T4twBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KxpktJBj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KxpktJBj"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-591c98ebe90so5112688e87.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 12:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763410123; x=1764014923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8IeajO+LKfiTWjgb9/LynkoZi0BDB3SfDWMQAsNP9Q=;
        b=KxpktJBjKPbBpynuF8Pz/0fn3yQOHh4y658WI53aV6eNhHAqfzu812ml/fWQua+uJv
         hPzpni+Q8xqYGSZRDTalnBYoILuBGC0DdrOkm6LJba5j/o95Ak3vkGvQwOGd3QPY4QAq
         mVriFdLSpNAy1Jh9Xq7CUiFGgE7jcnSRSFxfth+G2NsPvG6ojV8uwgmiwUjCvK332Ihj
         yBeXwbfCxdhhR3Gh4Fwn3G7ucUrNx7oSP9t2yANx3kKDLVyBcweqAKkFOzxZH1GfzxQh
         Ps32Gt0eRCQWtmt/1ZZM0r8o0tlLbr26FpsxfHKBpzMlSfC1QnekXoPMnWruaxJQS/4C
         Q+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763410123; x=1764014923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8IeajO+LKfiTWjgb9/LynkoZi0BDB3SfDWMQAsNP9Q=;
        b=O48gZ2U84kwg3g3Z5mnoVxmXnkgJvH6WCLi3oco5ty2bGN2u3ucheSUkqKhCJ3G7Ym
         YxTB1MoYCW8muKpVfKkAw7AIKjhvAntX4P+9aiQsLwfcAeSBNFijAHKaaBC4nChBUhdq
         h5epxxB0oEwsfBKvK/hciDUuf5vcU+zbCJiypORLEF4Ax4IZPEDpbaZyJ8ESK6zLTpxc
         aQbPwPTHhGXYY4ZhinOHy58bxAX2syqIeNhvTBWa77Tri7n1AxqQxM8ZcHWU065XWbBa
         dd2DTTGSB0RJO7CmkYLX2yJnNmM6JBvidRPYWTKx5XI8uFn9TBb0IdwGdQDtob68cllx
         MMcA==
X-Forwarded-Encrypted: i=1; AJvYcCV6xxVvywRGEy5EO72FfBvmUvW34kqRWzjcM8qR7rRF118QkqXgdAoBkiZ1Y930BV0UJo01cZu7f5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnedNiGCHpKRTari75nyROI0IRVBorjRZN7mmpyI9t7ACWPhF5
	zM7doFCo03MhiuzpYkZBvAogzYKxSunRYtNI9YkSmmuJN0S1a8blZrnO4+zMBhvug/YmrOq7+u7
	mpWJv9mDIUWY343eBj4bU4N2oBeKBtgIeTQ2vcT5X
X-Gm-Gg: ASbGncvgAHnp4UoKVC/6BSxTp1xuAH2krkKRtIlioXgyZiXp75shCHEfgfjecuMIEhu
	FEILY/Hqqm1V8PlHDtkEaXK4wusy8hQXAbeX5JOJaKgYkXKCipECNy2h+U5ZsYYP0jv53/AsTau
	D146X99Kg0o4gOV3dIj9mhzELoQF0PUFqznsrWz7acNcbat4rWVGGCWhUAoydcKLm2jb0J2ORLG
	euSyTmJn+6VzwtzwMlEJTe0sgSvRcvSHzvMcu1W8zXyy6NTCa5pczwRKsmp6bRUGeoy1+hD5r3r
	bFANQWeC3DAa/W36
X-Google-Smtp-Source: AGHT+IHojPwd3v72NJVpkRmb3ZkvRiR6CtkdMhnImHWMeD919h0DtLK7G2dHr+aPFZd7TlllVFDo3XPzHq7+z0cC59I=
X-Received: by 2002:a05:6512:b17:b0:594:27c6:a03 with SMTP id
 2adb3069b0e04-595841af94fmr4509003e87.13.1763410122875; Mon, 17 Nov 2025
 12:08:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-19-pasha.tatashin@soleen.com> <CALzav=edxTsa7uO7XxiUSx+DZiX169T4WL39vYsn3_WcUuVKrg@mail.gmail.com>
In-Reply-To: <CALzav=edxTsa7uO7XxiUSx+DZiX169T4WL39vYsn3_WcUuVKrg@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Mon, 17 Nov 2025 12:08:14 -0800
X-Gm-Features: AWmQ_bn0yHZxh94v8VlTzlMn4GZr7M3WPHVUsDMCpZs3Y3uXKCxbVDFrAaiWm-s
Message-ID: <CALzav=f+6hQ-UYBpwmAyKHPmtvEq-Q=mOL20_rZmAcTyd87+Vg@mail.gmail.com>
Subject: Re: [PATCH v6 18/20] selftests/liveupdate: Add kexec-based selftest
 for session lifecycle
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, rppt@kernel.org, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 11:27=E2=80=AFAM David Matlack <dmatlack@google.com=
> wrote:

> Putting it all together, here is what I'd recommend for this Makefile
> (drop-in replacement for the current Makefile). This will also make it
> easier for me to share the library code with VFIO selftests, which
> I'll need to do in the VFIO series.
>
> (Sorry in advance for the line wrap. I had to send this through gmail.)

Oops I dropped the build rule for liveupdate.c. Here it is with that includ=
ed:

# SPDX-License-Identifier: GPL-2.0-only

LIBLIVEUPDATE_C +=3D luo_test_utils.c

TEST_GEN_PROGS +=3D liveupdate
TEST_GEN_PROGS_EXTENDED +=3D luo_kexec_simple
TEST_GEN_PROGS_EXTENDED +=3D luo_multi_session

TEST_FILES +=3D do_kexec.sh

include ../lib.mk

CFLAGS +=3D $(KHDR_INCLUDES)
CFLAGS +=3D -Wall -O2 -Wno-unused-function
CFLAGS +=3D -MD
CFLAGS +=3D $(EXTRA_CFLAGS)

LIBLIVEUPDATE_O :=3D $(patsubst %.c, $(OUTPUT)/%.o, $(LIBLIVEUPDATE_C))
TEST_PROGS :=3D $(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED)
TEST_PROGS_O :=3D $(patsubst %, %.o, $(TEST_PROGS))

TEST_DEP_FILES +=3D $(patsubst %.o, %.d, $(LIBLIVEUPDATE_O))
TEST_DEP_FILES +=3D $(patsubst %.o, %.d, $(TEST_PROGS_O))
-include $(TEST_DEP_FILES)

$(LIBLIVEUPDATE_O): $(OUTPUT)/%.o: %.c
        $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@

$(TEST_PROGS): %: %.o $(LIBLIVEUPDATE_O)
        $(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $<
$(LIBLIVEUPDATE_O) $(LDLIBS) -o $@

EXTRA_CLEAN +=3D $(LIBLIVEUPDATE_O)
EXTRA_CLEAN +=3D $(TEST_PROGS_O)
EXTRA_CLEAN +=3D $(TEST_DEP_FILES)
