Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5833403E3
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 11:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783596765; cv=none; b=pm+2AvvsI43LI5C566ugcmOJRmbF2Y/SfWC7JrKXW1LLMgrwcdDPjCbT/E5Yi3H4RQsW+GD5GmmUK+a+RCXThgI65bNHlVxvXYtCWmAYZ/phuCMllWpiUZkLH3nlvNOjBuw1/ABd3LargEASv9W96pc5GkHJ+hRSn/ZrxS2hDAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783596765; c=relaxed/simple;
	bh=z16PvigLS058MHv1wfx29a13QNUFK91jo1BID9oENIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFCbaTpgR1CuNm0PaoHJY8k5pB6+/INB2BavzIVtSE4oP+plGvSvO3AOyn2ait6ufrS7oqVaYOGrO2eZA0fGhSNi3zgJhfpbVSyufzyIqqIA1ZYBX2dj4bBQKambCRT3+RkwW/zFcYmS9+AjYQre22ALtEFgNljer9QzTfQ7VZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SPps1snL; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SPps1snL"
X-Forwarded-Encrypted: i=1; AHgh+Rq1lM9VJS7j/oyJG2BB6IBILF5VVRICr5y0rYZHNFLQ8CIWnhIr9jT6i6jAEXfnNi5m5DbHn3+fh3s=@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783596762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oqW88DJFtJlNXKD0B61OXZAk1eUBO5rLtZZ2XEzp0us=;
	b=SPps1snLHmHi8owc8yZInpY0N94VQO/c2je0P7/MWqVWy0YEOoHwWmiB66KVAzU5WDp3T6
	WEzVsxsNNERIke5YEhgm7N6A8Skmzykl/6J0prZ0/p9q55MQk9cUQl8ME8R5pTpzxJ1Rsw
	C8yyKQLP5r6beWcQJxsjjjVAkbEXUHM=
X-Gm-Message-State: AOJu0YyoxYbrHBbNYwI6/vavolxqfSdREGTsUPQmaJz1coxtTpNlJGFY
	qrVGp3f6YCAEgvGEYybv8302JY9hmIvfi1/cYtw4tCc7xEO9ip8J/EnOtxNv+h+3jx1w9Zm9C2w
	9yXiDRNGD840ScFfR0/P0tRhHzN/BXTVHtye3vmCC
X-Received: by 2002:ac8:58cd:0:b0:51c:7a8b:c3ff with SMTP id
 d75a77b69052e-51c9a8c4a19mr6188411cf.24.1783596742599; Thu, 09 Jul 2026
 04:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
 <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com> <ak-Fyvzpj9SkF75j@J2N7QTR9R3>
In-Reply-To: <ak-Fyvzpj9SkF75j@J2N7QTR9R3>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 9 Jul 2026 12:31:45 +0100
X-Gmail-Original-Message-ID: <CA+EHjTydGzbgi9FwWQaFjuRNqUFC_HeOfHggZAHhPL4FfLYBog@mail.gmail.com>
X-Gm-Features: AUfX_mxg-IrJum1hjxntITyGClBTO4jOHGBsAV60-jkEzyj12MdjxQXpT6c3yl8
Message-ID: <CA+EHjTydGzbgi9FwWQaFjuRNqUFC_HeOfHggZAHhPL4FfLYBog@mail.gmail.com>
Subject: Re: [PATCH v11 00/29] KVM: arm64: Implement support for SME
To: Mark Rutland <mark.rutland@arm.com>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Ben Horgan <ben.horgan@arm.com>, Jean-Philippe Brucker <jpb@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On Thu, 9 Jul 2026 at 12:28, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Thu, Jul 09, 2026 at 11:26:41AM +0100, Fuad Tabba wrote:
> > > base-commit: 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
> >
> > I think this SHA is local to your tree. I can't locate it, and neither
> > could Sashiko [1, 2].
>
> That's the tagged commit for v7.2.-rc2. See:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
>
> I think that neither you nor sashiko have fetched mainline recently.

Thanks, I have 7.2-rc2, but `git show
4c45e14df2f4e77982ad70d6d8e3fe750edd4c37` gives me `fatal: bad object
4c45e14df2f4e77982ad70d6d8e3fe750edd4c37` . The SHA for rc2 is
8cdeaa50eae8dad34885515f62559ee83e7e8dda (which is what shows in the
link above, not sure what ID is, which is the part that matches your
SHA.

That's what confused both Sashiko and I, since it's used as the base-commit=
 SHA.

Cheers,
/fuad

>
> I have it locally after fetching from Linus's tree, as below.
>
> Mark.
>
> | [mark@lakrids:~/src/linux]% git describe 4c45e14df2f4e77982ad70d6d8e3fe=
750edd4c37
> | v7.2-rc2
> | [mark@lakrids:~/src/linux]% git show 4c45e14df2f4e77982ad70d6d8e3fe750e=
dd4c37
> | tag v7.2-rc2
> | Tagger:     Linus Torvalds <torvalds@linux-foundation.org>
> | TaggerDate: Sun Jul 5 14:44:06 2026 -1000
> |
> | Linux 7.2-rc2
> | -----BEGIN PGP SIGNATURE-----
> |
> | iQFSBAABCgA8FiEEq68RxlopcLEwq+PEeb4+QwBBGIYFAmpK+lYeHHRvcnZhbGRz
> | QGxpbnV4LWZvdW5kYXRpb24ub3JnAAoJEHm+PkMAQRiGsv8H/Rn7Hr3Hp8t6au8B
> | xQueZThJWjqQ4v8pyLnXF6OomKiDR24OTXMCrFgDkcmZ7RK2ALqowI3tQVwLUTuI
> | yUN0qL2z2y+LyTcO0CYf3Lple8KlgLAXYMsv7pGLsOvhS7BW2jW97/bcbpUNxoHb
> | eghxqbIEnyRImUbbyg+nW7VVk65RKdPUNkBPXfQ2NMVwe+SDE5Rl+NXNVqDNjGad
> | soDTUBrD9yXkWX+4s0myleE62UzzH5nYgGPQeQgYmzWgq7LybH6WBlbQK9D7ODJR
> | Cw3LCq1hwZZ2w04Yx+XwMHquGJYHW8L2pj77h95uhzksz8buKnM0AGwBCTC6RMoi
> | AyUQvdc=3D
> | =3DJUWl
> | -----END PGP SIGNATURE-----
> |
> | commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda (HEAD, tag: v7.2-rc2, k=
ernel-org-tip/locking/debug, kernel-org-stable/master, kernel-org-rw-pm/mas=
ter, kernel-org-rw-pm/fixes, kernel-org-powerpc/topic/ppc-kvm, kernel-org-p=
owerpc/next-test, kernel-org-powerpc/next, kernel-org-powerpc/fixes-test, k=
ernel-org-powerpc/fixes, google-android-kvm/master)
> | Author:     Linus Torvalds <torvalds@linux-foundation.org>
> | AuthorDate: Sun Jul 5 14:44:06 2026 -1000
> | Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> | CommitDate: Sun Jul 5 14:44:06 2026 -1000
> |
> |     Linux 7.2-rc2
> |
> | diff --git a/Makefile b/Makefile
> | index b9c5792c79e01..b4035d3cef266 100644
> | --- a/Makefile
> | +++ b/Makefile
> | @@ -2,7 +2,7 @@
> |  VERSION =3D 7
> |  PATCHLEVEL =3D 2
> |  SUBLEVEL =3D 0
> | -EXTRAVERSION =3D -rc1
> | +EXTRAVERSION =3D -rc2
> |  NAME =3D Baby Opossum Posse
> |
> |  # *DOCUMENTATION*
>
