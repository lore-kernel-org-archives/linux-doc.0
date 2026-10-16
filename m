Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26AD38A720
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 14:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162407; cv=none; b=Ip9YwbndXn5p2gPssB3GVm6/hTAh37hWAhMKk+Y3NqB8Ofx0ft6utf6JJwycRneHJUDGnFZxsWv4jdZDfaJvvRM9yxVfDpFgbU2fwOBCejbTV+12sEbJOrLIGiYMjnqyn+JZHYGEuojrl62oX5WG5saBcJXgocJLVjzOjNpL8CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162407; c=relaxed/simple;
	bh=uFX4zjvXso4VeDI316ejRhA10e98d4MoCS8GSbY45IA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=lTutBXlNCrLH3bKojRgV0E4qGz8XLpj1kr2JxQbwjWJ6gMSY0A8bQiCoALPlE26BJRNKxd3Vblee2g/qxlOqs2slHvbMURCBRYlb9sAaL7yzhauen4rWwHL4TEj0IfDXAN1A6tk21Nty9j/NzDTCbX1N9Wotiy91UdsZyxbPeZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLk84Qk1; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLk84Qk1"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso65701a91.0
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162405; x=1792767205; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uFX4zjvXso4VeDI316ejRhA10e98d4MoCS8GSbY45IA=;
        b=OLk84Qk1ZV32xXjKwIhWrmCRekh/R7+SIZ7FLJX2G7XZp1XkvUgoTQHHrBqIReHH1K
         cl+7hXXmcMNWMmagWjrJ8Ow1SJWO49mE75m9+vfeAfR6AIi3b+8/njr1rmGIIB3i/x/W
         LF8FXKSQIBf81NmAlA0KwVRqPJqcYWi2GBUdAx5s2KDtqAL29O92U1nQT7CBszxTW8zu
         3xLvLB09okAQyVqGEOZpsp/xHIhqjDPKrEvgWFawcXzio5KOqIAAn8KyF4tTChaCqsIn
         HRTGWDxoyG8bsIhsM7L43/TEncFh0LyPCdXkrV/5Ah37Ko6eNNMsINA7eQx8qtVwSx3b
         Zirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162405; x=1792767205;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFX4zjvXso4VeDI316ejRhA10e98d4MoCS8GSbY45IA=;
        b=NwK09w8tYiPaCSC7iwh1tUk9J00yjozgHuz8W9FVM5ZTbjY86RbWYyMg7k27+1bX+b
         1al1z8XNwPsIbpbepxQSGlEuOQjUABWwFLkXohK+nmdxYtt6dcwBNSVe0KhW5ScwQaSO
         q5ntI73dwRVAyKggab0PUk38oBSai/Y8VM/EFPzsNOgitrOp6gCIRxrFmSt2DqaAtt3H
         oNuEor7zO/etTJyPAD50VbOt36NvVJIEvw5XgOyeVlXM+c7XRIyyy0PIHE1tZz+IASvW
         DlfMaszhcwotxZkJqjODiM+xJdZW1+ECICYwTg6N3nUzXuN6AiooPA7/+CZ5Q19VfQG8
         hiWg==
X-Forwarded-Encrypted: i=1; AKwUvBz4i+wj3cYv26Xt6vs4/vyWVWnCvwOrSfUIZ4aUtFl+FVljQGpqquy6YhujbvAhfIcO/sivLdKBqLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSCxAfb1M3hKhMpys/pu9aizrPckjjYYSkfsdS5ctxMbqn3tBY
	E0u1RrIDERxaovJXM72R0dZ+gRq4BjUiTDsJHwdoPuJxedmDIJbV+A4G
X-Gm-Gg: AYBFou0AX70vY8THgTDM1i3kymxzt77pd93sC0oUBBhkWebVmIHUkYJTPZ7FXdtzICD
	4/Qj8qS1zAqJ8xbnlkLH7/kU6hx8f+noE52CjEbotmFpkSodFW19mZ6BKfF2L1m+1iiG6ZAqiva
	Oygc8aY5k6QO8U0nDYapQMICkLiV1uKYLtHsGDCE+aSL8Dnb7o7F2HWsb8GCF/62bc82mqWrc/K
	c2fTo39CbdTIeVN/zIjBLKt7bZ+K4wblE2jzFaN5qpA94IEFus0V+rY0GoJY+6J6cWeEb5df8zo
	W3wa6LP/ouGzGrD9aWBfClTnSWA6fNvCYki1AouJgb2Dg1+LjWqXRE5M5Txoul+Mgx5WBSi+qBD
	mBLG9VMU2noh3ri+W/fXPekRf5HOqkaOzLO5o2GKX79wYPLjgl/3Judz3YEeXwJdrAMLDwLXgc9
	n54wGgY8UTzCntRNknup2fQBsgQo0r+ROdqKCLPuL6w6c2qB3ZM66aSH4IyB13OFdkTJwA5Vy5k
	LQc5k77H88srZaCHSctGHl0AcgSFmCa+j7OIowEPkIY8gBrBIxLYd5/lGefqXiyNaCWmUJvDpU9
	SMk=
X-Received: by 2002:a17:90a:e7ca:b0:3ab:f38:2b3c with SMTP id 98e67ed59e1d1-3acef13eb0cmr59920a91.28.1792162404946;
        Fri, 16 Oct 2026 07:53:24 -0700 (PDT)
Received: from localhost ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9474b52fsm10875551a91.9.2026.10.16.07.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 14:53:23 +0000
Message-Id: <DM6CJUE4J2LX.2NR5QB5X3N0Y6@gmail.com>
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Alasdair Kergon" <agk@redhat.com>, "Mike Snitzer"
 <snitzer@kernel.org>, "Mikulas Patocka" <mpatocka@redhat.com>, "Benjamin
 Marzinski" <bmarzins@redhat.com>, "David Howells" <dhowells@redhat.com>,
 "Jarkko Sakkinen" <jarkko@kernel.org>, "Paul Moore" <paul@paul-moore.com>,
 "James Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 "Eric Biggers" <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Andrew Halaney" <andrew@amutable.com>, <dm-devel@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <keyrings@vger.kernel.org>,
 <linux-security-module@vger.kernel.org>, <bpf@vger.kernel.org>,
 <fsverity@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2 0/3] keys: Add well known IDs for
 fs-verity/dm-verity keys
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261008-ajhalaney-dmverity-key-identifier-v2-0-008456d189cb@amutable.com> <20261012-broschen-inanspruchnahme-gebilde-d72cf2b99cda@brauner> <DM5UD20248FG.3BXPS76LK06F5@gmail.com> <20261016-ratlos-endkunde-eindimensional-1fe5eef08d13@brauner>
In-Reply-To: <20261016-ratlos-endkunde-eindimensional-1fe5eef08d13@brauner>

On Fri Oct 16, 2026 at 8:27 AM UTC, Christian Brauner wrote:
> On Fri, Oct 16, 2026 at 12:38:11AM +0000, Alexei Starovoitov wrote:
>> On Mon, Oct 12, 2026 at 12:38 PM Christian Brauner <brauner@kernel.org> =
wrote:
>> > Applied to the vfs-7.4.keyring branch of the vfs/vfs.git tree.
>> > Patches in the vfs-7.4.keyring branch should appear in linux-next soon=
.
>>=20
>> What is this branch based on ?
>> v2 was sent against bpf-next, because
>> commit 264d8fd2794f ("bpf, keys: Add a bpf keyring for program signature=
 validation")
>> is only there.
>> All hunks in keyctl.h, key.h and process_keys.c have its lines as
>> context, so the patches don't apply to -rc as-is.
>> And patch 3 documents KEY_SPEC_BPF_KEYRING.
>
> It's based on the portion of bpf-next that has Daniel's keyring patches.
> Which means I just wait until bpf-next is merged and then send it as a
> follow-up pr.

ohh. that should work. If it's simpler I can take this patch set into bpf-n=
ext,
so you wouldn't need to monitor merge window that closely.
