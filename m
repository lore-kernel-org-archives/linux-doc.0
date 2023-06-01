Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D39C7EE23
	for <linux-doc@archiver.kernel.org>; Thu,  1 Jun 2023 21:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233263AbjFAVlp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Jun 2023 17:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233143AbjFAVln (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Jun 2023 17:41:43 -0400
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0731A7
        for <linux-doc@vger.kernel.org>; Thu,  1 Jun 2023 14:41:31 -0700 (PDT)
Date:   Thu, 01 Jun 2023 21:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uplinklabs.net;
        s=protonmail; t=1685655688; x=1685914888;
        bh=ncMVbNCtSXe0DvnH0neUKu6XvupvEmA5tfm8tyhtji0=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=eJT6VUtdeyED77CihDB3HvGSY7PsZ4IPKLgt9ikls1HSxZTKlFIp9OMj3I6vFkKxj
         4Q71uP1dDu5e0AAfR00kGQzYyd9pXSmddw5sQRauaSOJA9sAp5OaLAOIpkG6rtAgGH
         KVD6304oI6a9XDO5F6QEIuzuAdhybaj39Ig5o/j8er5E1bO5H5JoqGinzU8/MAaHr0
         c6Nd/jJEyJdO3gJGNTR5/xKU21N05VT3CY57yJhzWW5hbBPzAXMMB775/55VXc3UXi
         XBeijehgmVeXjGlpUG6dmy2kxrlRZIUoJvUy6nMs3XgtgDzmcoRPkUADILlJ6ngXCo
         Ia9c9jgUvPonQ==
To:     Peter Zijlstra <peterz@infradead.org>
From:   Steven Noonan <steven@uplinklabs.net>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>, kernel@collabora.com
Subject: Re: Direct rdtsc call side-effect
Message-ID: <YveIgyZYN48CEPKlxf6r_CfVBGuON83brWVxnVJGtXW70bDprPOiAtEMeKELDJj3lVYuZm7fTDQnMIuheMN01YfqfWbCGYia0uWcWIx59oM=@uplinklabs.net>
In-Reply-To: <20230601203127.GY4253@hirez.programming.kicks-ass.net>
References: <6719fb05-382c-8ec4-ccda-72798906a54b@collabora.com> <87mt1jeax1.ffs@tglx> <87h6rrdoy0.ffs@tglx> <L9sTQNWVFoNxz-HmzFoXBX4twp84wuAx5Mf4LcxWw9k0rTAXI32rSl7WEOr7058iN6_Nyf8fLN-Ye3sq5THHjJCKG2vQLlpnVs77kKlLFV4=@uplinklabs.net> <20230601203127.GY4253@hirez.programming.kicks-ass.net>
Feedback-ID: 10620438:user:proton
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------66abe1e2681810bd2ab224c8c40637c46d62c8a8760c5753c9d567431424fd5c"; charset=utf-8
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------66abe1e2681810bd2ab224c8c40637c46d62c8a8760c5753c9d567431424fd5c
Content-Type: multipart/mixed;boundary=---------------------b7acdc7d3b503f22c0cb7da76c5decd3

-----------------------b7acdc7d3b503f22c0cb7da76c5decd3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

On Thursday, June 1st, 2023 at 1:31 PM, Peter Zijlstra <peterz@infradead.o=
rg> wrote:
> What about kernel based emulation? You could tie it into user_dispatch
> and have a user_dispatch tsc offset.
> =


> So regular kernel emulation simply returns the native value (keeps the
> VDSO working for one), but then from a user_dispatch range, it returns
> +offset.
> =


> That is; how slow is the below?

It's around 1800-1900 clock cycles on this system (modified patch attached=
, compile fix + rdtscp support).

It's definitely better than the userspace signal handler (20x vs 100x). Al=
so compared to reading one of the clock_gettime() clocks when current_cloc=
ksource is 'hpet', it's about twice as fast. So that's at least in the rea=
lm of being usable.

Since faulting would still make the vDSO clocks go through this path we'd =
have to be careful that whatever offsets we throw into this path don't aff=
ect the correctness of the other clocks.
-----------------------b7acdc7d3b503f22c0cb7da76c5decd3
Content-Type: application/octet-stream; filename="tsc-test.patch"; name="tsc-test.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="tsc-test.patch"; name="tsc-test.patch"

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC90cmFwcy5jIGIvYXJjaC94ODYva2VybmVsL3Ry
YXBzLmMKaW5kZXggZDMxN2RjM2QwNmEzLi5hNjA3MmM0ZTBhOTcgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2tlcm5lbC90cmFwcy5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC90cmFwcy5jCkBAIC02NDUs
NiArNjQ1LDM2IEBAIHN0YXRpYyBib29sIGZpeHVwX2lvcGxfZXhjZXB0aW9uKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQogCXJldHVybiB0cnVlOwogfQogCitzdGF0aWMgYm9vbCBmaXh1cF9yZHRzY19l
eGNlcHRpb24oc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCit7CisJdW5zaWduZWQgaW50IGJ5dGVzOwor
CXVuc2lnbmVkIGxvbmcgaXA7CisJdTMyIGVheCwgZWN4LCBlZHg7CisKKwlpZiAoaW5zbl9nZXRf
ZWZmZWN0aXZlX2lwKHJlZ3MsICZpcCkpCisJCXJldHVybiBmYWxzZTsKKworCWlmIChnZXRfdXNl
cihieXRlcywgKGNvbnN0IGludCBfX3VzZXIgKilpcCkpCisJCXJldHVybiBmYWxzZTsKKworCWlm
ICgoYnl0ZXMgJiAweEZGRkYpID09IDB4MzEwZikgeworCQlhc20gdm9sYXRpbGUgKCJyZHRzYyIg
OiAiPWEiIChlYXgpLCAiPWQiIChlZHgpIDo6KTsKKwkJcmVncy0+YXggPSBlYXg7CisJCXJlZ3Mt
PmR4ID0gZWR4OworCQlyZWdzLT5pcCArPSAyOworCQlyZXR1cm4gdHJ1ZTsKKwl9IGVsc2UgaWYg
KChieXRlcyAmIDB4RkZGRkZGKSA9PSAweGY5MDEwZikgeworCQlhc20gdm9sYXRpbGUgKCJyZHRz
Y3AiIDogIj1hIiAoZWF4KSwgIj1kIiAoZWR4KSwgIj1jIiAoZWN4KTo6KTsKKwkJcmVncy0+YXgg
PSBlYXg7CisJCXJlZ3MtPmN4ID0gZWN4OworCQlyZWdzLT5keCA9IGVkeDsKKwkJcmVncy0+aXAg
Kz0gMzsKKwkJcmV0dXJuIHRydWU7CisJfQorCisJcmV0dXJuIGZhbHNlOworfQorCiAvKgogICog
VGhlIHVucHJpdmlsZWdlZCBFTlFDTUQgaW5zdHJ1Y3Rpb24gZ2VuZXJhdGVzICNHUHMgaWYgdGhl
CiAgKiBJQTMyX1BBU0lEIE1TUiBoYXMgbm90IGJlZW4gcG9wdWxhdGVkLiAgSWYgcG9zc2libGUs
IHBvcHVsYXRlCkBAIC03NTIsNiArNzgyLDkgQEAgREVGSU5FX0lEVEVOVFJZX0VSUk9SQ09ERShl
eGNfZ2VuZXJhbF9wcm90ZWN0aW9uKQogCQlpZiAoZml4dXBfaW9wbF9leGNlcHRpb24ocmVncykp
CiAJCQlnb3RvIGV4aXQ7CiAKKwkJaWYgKGZpeHVwX3JkdHNjX2V4Y2VwdGlvbihyZWdzKSkKKwkJ
CWdvdG8gZXhpdDsKKwogCQlpZiAoZml4dXBfdmRzb19leGNlcHRpb24ocmVncywgWDg2X1RSQVBf
R1AsIGVycm9yX2NvZGUsIDApKQogCQkJZ290byBleGl0OwogCg==
-----------------------b7acdc7d3b503f22c0cb7da76c5decd3--

--------66abe1e2681810bd2ab224c8c40637c46d62c8a8760c5753c9d567431424fd5c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wnUEARYKACcFgmR5EGIJkAi2TYeeRSZQFiEE707zOy6TKdatSeTPCLZNh55F
JlAAAPDAAP4uwiUg9w+2pjjQun/Or7s8ILn75ADZ364ArYdpgetOHgEAhFh6
nfHKyAB9fLR/4Mgs/2KZvBGrn/lHGzzSy9IlNQs=
=Y+zl
-----END PGP SIGNATURE-----


--------66abe1e2681810bd2ab224c8c40637c46d62c8a8760c5753c9d567431424fd5c--

