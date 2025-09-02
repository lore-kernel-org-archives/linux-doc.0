Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136A92750E6
	for <linux-doc@vger.kernel.org>; Tue,  2 Sep 2025 22:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756851680; cv=none; b=uZoFUc5hI3cpddTJnaOYm69kSRSkvQrgcM2QofLgWCD3CnumFJkHokr4jAlu5hHMvt6mJVkNbLIOhjy9RQfFgGPVrVar/Z0wpNJb19RHwwtXTNwbmvaK+yBQNbcL5vwPS3w2Tk2GhzCLzq9/D8JJI+mtuB8VTYYmlEWF6cGAhmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756851680; c=relaxed/simple;
	bh=uhrGdUwtX0TRrHmzp18ffizdjSUfmH13xn/mmFzf3K0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scbQzWKQPdp7FfXsMNw3B6xhfagQPxcI/vM+8Ijdd2Mz3NlUk8vpIyd8bWSN8wfYoEMa6VSZ79muSyiDqBhmMSf16URZH06ggf2WF8ZzQCWYObukscLlCqFFdCMjmOkBPUqo9RK9cD5Nh435e0pMa6UcjTDrF4AYQ2V7L4zY31U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=YZXeCm/7; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="YZXeCm/7"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55f6f434c96so3714784e87.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Sep 2025 15:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1756851677; x=1757456477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhrGdUwtX0TRrHmzp18ffizdjSUfmH13xn/mmFzf3K0=;
        b=YZXeCm/7GBFRBljfCnajK0LOK+eFyDX8BLB+D9ZwyBVU55xyJcMli4pnmsUrRsloty
         +ZZGtCu3Y6cU/UpJOWsMDRssPDdMbAEQrnGixIZG6ApzEZfIhJVMJMv47pyAM6luug30
         QmpihjkjU80vv3XeIYuGlLUITmjutbOw34LBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756851677; x=1757456477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhrGdUwtX0TRrHmzp18ffizdjSUfmH13xn/mmFzf3K0=;
        b=UcGvFmlSrWPNDyI2IqeX+fNbJV3aWm3/lKdcyHPh2mFynkx6lsWKpcVfxG5/AYx03M
         A3b8lfGJxHexVhivIcAcv09UrjSjxHGF11p9Rj52+CeviQZMWH8OrTbMTC5nIQ+5FfJn
         eeO1RMfrANjaSbtTLEY420HES7vhNi4eCBgYMEQ6zaXj9BIUDwV2dfmh1sHrlIexGgtG
         NgxZuwq7fQ5s1V9M8iOoehKED0PlLuoBEpStfZy2XYOYDkxMDPrYdo5/8pywStlBgKti
         Df9YHz0QdXh0rjzyNDsaip4Tsy+AjNb1LPfWfJNl2hzV7dQ50M/XNQAvEuKYdHti70NF
         4HiA==
X-Forwarded-Encrypted: i=1; AJvYcCXNCVGxRMh3K4ghX1WycAQDXm5PD/rIWmJndiHcPwf8ZAX5ASGPHwkAT/KJ1BdGHvcxrLHXZc6M6Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZNM/1Yn1Mnmwp9mMfdNAg4F84mBbRri3l0ZI+WObFS6J5DwQN
	bg7lLie9Gv3as/finCnI2dcfQg4N01eCmRv9BKwrK+TZWopvUw58T3POIm3+E6qwyjNZz0ON/gm
	vj1/7S+TKgca/Ae8uuB3rs1i0eDU3Lq/+mbWR9FASkA==
X-Gm-Gg: ASbGncs2RpSQjquEbJYw5ucnBmfW1jhSHfSlZ5goZRClyWiUPUI4noSAiOv/ba0OXgl
	431mGfxAaqdtxDsYmtiu0zLWZ0BbizrZsvnkIqsJCEPv8acm3H8iFIbiGcFlTQhZX/j6MubqaKD
	71SbXYeMB6ImZ8s1NCH11JIE3R6RDnXTgdSUdUZLuQ8u+BcKRNFoz7cwfwScpb2U55ArKsiewGd
	+Y66mdgI1Zj2lox7T1tz7Jeq6Hf5GVMB9sFvXg/oI8DmJilYUCWDOs=
X-Google-Smtp-Source: AGHT+IFBza3hqagc0puDleD+Unkl9olkJ3klet94+JtsC9LdhtggFejId/AtdG7cn9nz3QYINpZRSm2wOlqELxCKl/Q=
X-Received: by 2002:a05:6512:1389:b0:55f:6fcc:6f4e with SMTP id
 2adb3069b0e04-55f7089c3a6mr4162223e87.7.1756851677166; Tue, 02 Sep 2025
 15:21:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901-net-next-mptcp-misc-feat-6-18-v1-0-80ae80d2b903@kernel.org>
 <20250902072600.2a9be439@kernel.org> <834238b4-3549-4062-a29b-bf9c5aefa30f@kernel.org>
 <20250902082759.1e7813b8@kernel.org> <aLc2hyFAH9kxlNEg@arm.com>
 <d4205818-e283-4862-946d-4e51bf180158@kernel.org> <aLdfOrQ4O4rnD5M9@arm.com> <739c86b1-5cf5-4525-919f-1ca13683b77f@kernel.org>
In-Reply-To: <739c86b1-5cf5-4525-919f-1ca13683b77f@kernel.org>
From: Christoph Paasch <cpaasch@openai.com>
Date: Tue, 2 Sep 2025 15:21:06 -0700
X-Gm-Features: Ac12FXxOi9AsViKZtjtWxiVRlAl5eHnNmsfESqGUjGTMg6KF47joBlOhH8IUoMY
Message-ID: <CADg4-L-5f3a=3XCv5UaZG+47DHaO3NTk5+4mp-nWJ2rFXx-5WQ@mail.gmail.com>
Subject: Re: [PATCH net-next 0/6] mptcp: misc. features for v6.18
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, mptcp@lists.linux.dev, 
	Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Gang Yan <yangang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 2:38=E2=80=AFPM Matthieu Baerts <matttbe@kernel.org>=
 wrote:
>
> 2 Sept 2025 23:18:56 Catalin Marinas <catalin.marinas@arm.com>:
>
> > On Tue, Sep 02, 2025 at 08:50:19PM +0200, Matthieu Baerts wrote:
> >> Hi Catalin,
> >>
> >> 2 Sept 2025 20:25:19 Catalin Marinas <catalin.marinas@arm.com>:
> >>
> >>> On Tue, Sep 02, 2025 at 08:27:59AM -0700, Jakub Kicinski wrote:
> >>>> On Tue, 2 Sep 2025 16:51:47 +0200 Matthieu Baerts wrote:
> >>>>> It is unclear why a second scan is needed and only the second one c=
aught
> >>>>> something. Was it the same with the strange issues you mentioned in
> >>>>> driver tests? Do you think I should re-add the second scan + cat?
> >>>>
> >>>> Not sure, cc: Catalin, from experience it seems like second scan oft=
en
> >>>> surfaces issues the first scan missed.
> >>>
> >>> It's some of the kmemleak heuristics to reduce false positives. It do=
es
> >>> a checksum of the object during scanning and only reports a leak if t=
he
> >>> checksum is the same in two consecutive scans.
> >>
> >> Thank you for the explanation!
> >>
> >> Does that mean a scan should be triggered at the end of the tests,
> >> then wait 5 second for the grace period, then trigger another scan
> >> and check the results?
> >>
> >> Or wait 5 seconds, then trigger two consecutive scans?
> >
> > The 5 seconds is the minimum age of an object before it gets reported a=
s
> > a leak. It's not related to the scanning process. So you could do two
> > scans in succession and wait 5 seconds before checking for leaks.
> >
> > However, I'd go with the first option - do a scan, wait 5 seconds and d=
o
> > another. That's mostly because at the end of the scan kmemleak prints i=
f
> > it found new unreferenced objects. It might not print the message if a
> > leaked object is younger than 5 seconds. In practice, though, the scan
> > may take longer, depending on how loaded your system is.
> >
> > The second option works as well but waiting between them has a better
> > chance of removing false positives if, say, some objects are moved
> > between lists and two consecutive scans do not detect the list_head
> > change (and update the object's checksum).
>
> Thank you for this very nice reply, that's very clear!
>
> I will then adapt our CI having CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF
> to do a manual scan at the very end, wait 5 seconds and do another.

FWIW - I am able to pretty reliably reproduce the kmemleak. However, I
also tried adding an inline kmemleak scan to the test harness (did it
once with, once without a sleep). When I do that the kmemleak
disappears :-)

(not saying that adding the scan isn't useful, just pointing out that
this particular leak seems to be related to how quickly we iterate
over the testcases)


Christoph
