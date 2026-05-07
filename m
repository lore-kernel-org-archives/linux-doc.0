Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AAA47AF42
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 19:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778181597; cv=pass; b=f+x3eSi6wdoxriZCBklHrcuzj5n6z4WRASsG0Q6M1x4C8jrh6sZY4GKX5CuwNCKbv4Y3lUcPIT5gt9NjSHFEFkv/y9K0iHMmI3pEi8LOF9cvrYcP+z1O6a1a+GEtHq1kz7Cj5grnJhd6IcmYVD3wHWCrT/FJJnVZSMn60JM/53k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778181597; c=relaxed/simple;
	bh=I5DZUCNXHDpvnJ8tiHxWBxQrtvvS0aWP/FaWpvJs1Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=opzyVkBXIh0hTwy09Se8S2wmERxxNZwofsI6gMGKAfNnpqq2/T7Q05TlE2glGHxqekAIW9f5OFLK4RjMKNFf9WxsXQpAZT1p2GF4ZhLZ8kC6093TgUBX1xF5apO705iLG6QoXn2rQTEAaWznjNVQ9e8kTKxgItMBWOuyZ7J1nTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=GLnNKXiY; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="GLnNKXiY"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-364eef1891dso993351a91.1
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 12:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778181595; cv=none;
        d=google.com; s=arc-20240605;
        b=DFRXA3/UNAZkw/NI0YgMiFq9y14O/q3wcYbsttffMfZdhR7uU9vGyGmfvwXjxPBS2e
         Tb7WUAprvoi8MBdg523NeNmC7kfH8wbjnkKraEw7Oihv4C/x9POI6njw9Ef9AZxl9gYY
         qw6uYKcr8gXx/Y71NcZGJVy5ShFM6S6I51SdtQAYTyQIcXy5uzYs9N+rAKzTwrC3jvTp
         MvR8a9/0PGNnwqBGjVvjMEpW5P4m4No/pIFkay3x5dzqwhOfeMM6NLNBtc/bd8DD47Iq
         qC3mGBHub/bpR38LvGhnZo9yISswYjDYtmIecNwBb844vlq60s/vb8BCMT9MzHXrpnNT
         SwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lLAJ2nIgwojcJGz7oCLjCvCHgUm4ZxZWAITSlIqPTzE=;
        fh=MqfiMVw9lcqF0TmPWmikzbG3x0e2/Qyv0gwM4TXXn8o=;
        b=DfKMkiXiLWT4zYbSTzh3w03TxtKj/RIVnI/5x/3IMQkLjISVcbaJvzHfhb8vtvfKJq
         VIY0thUc18IKtzWTDpAwVIEeLCrTvuYdkPGbdzBSwqNNpSBV6bqeA1zGkqALVudcw0Ej
         CihQ8a70tzu2ph2gFVrCd3tqvbpiftWdHNYT+34ZQRKhdOu+JmQLUMB0smbANt9Uph8y
         eMjG2CsjjpTVNoLKSEjGqRwBp78sjraPFByp3L/cQUv017AZ5qlaZdUmIfeLX7/w90p9
         5aaCeoN+VcDmQUwBR5uL3LYKCVgsI2YDfYg8rBssnlHcg+Z0jjzSYnRqb9u4yyJmJ1M8
         HXkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778181595; x=1778786395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLAJ2nIgwojcJGz7oCLjCvCHgUm4ZxZWAITSlIqPTzE=;
        b=GLnNKXiYDLm9X4lYJUk02s0b+xtbyxLM6HP4HQx4rvJuLbAOYJILY1cJpj1vNvYPq7
         IsgG3W/RqKyXG988mhDHnBhJKdvLepgkXwL0CiTNMCHdxOFlJqjE0CUq4yheVcwODhYy
         uN/JtKwkvlrtUbHhiMzDk0LHc94wDdqa1JuReUq3eOpJkysLpIO+F4ANHmloLujAkE8X
         T77szf4tb5LSXgz1RHfFaROnD6uMCDwWsDzAJBEXzhhkrDHauI8M2MxkOpBbou+zAAlv
         fC1A0peVt1fHW63vTiXaWyJh8nJ01Czu7BUWbHZRwpnyYQjWoKepZ3tLXLtcSt4vBAs1
         b1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778181595; x=1778786395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lLAJ2nIgwojcJGz7oCLjCvCHgUm4ZxZWAITSlIqPTzE=;
        b=La+SnpEELG842xI/0AbCH+b3xu02dFXWrjqAvmzjk2R9Lv1Nk9dwt3LRPvJeR2HkHK
         RjN9XRtsGMMmdpRRCBo8Ye7tddmyNemmB6gjnL3zL1HQfkgoWxe4W3DHdSkyG1H66NqN
         hRA1yt/j8w5V+WvWvmvt0rbMK6BXPzKQ28pKwec+V0CaTXXBscoohEf9z7gLI9bU8jRw
         ghQvQaOoUfs6dBkcByWkyuQExRR+VhSgizbZHTEw1IJNUJYPP88Pf6je6nUXfOKGmecx
         QOsTF9i1Ljv2vEEcINe7JQ8SsuHNMHvioeygEzZGwztZwYBvPHW5QVK8ZFRwGRgA3hfy
         2W2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Wwp6uUEvgUM/0nucJdlQQeWoCNfqeBDCV3QlWVWhn2v0jGpkg3QvLiWD1I1rh6wNHaYOPOdgmARg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMOEnUSi3HkSIPZ/Jvt3bozdW4tlvlnzjVGUcLBLoLIbZpkJCy
	EnOyd4mEhXi3qsOLXxWjEsk9pW3Uoppfs7kJYnbt0VlApG2mEG11IBQoor6z/aI8JlFJH/iylXJ
	4yITr1XrsiEK/+mSWSoWA8M9rb3hH14FaNvEFP/enCTsRCyqf1oc=
X-Gm-Gg: Acq92OHZOPpBgI2P5weg9i80aWYHugRPH+/qowA/cIoqV2tp9Bah0LZ0c8my4Wr+4fd
	dnXmrhriviFljwv2PRoWv3mPmmkM3l9D4NrYkAPmmM8tAVA1tF1mloxD8jv4zJxb9ZZN8JfDkJN
	sUjsNPgiWcIv5J7bo+qXjQ4LWcCSJXCTOOqI/Lmi7fT5r6Ot3zII91xtK6XNeg23Qm4tTDj7qbw
	FaD2TCNOUCdLFDtqTDcM5su3JNWH7oGRS+KgKLReDhJhh6KhkCOLCNiaZ8i+2aXJi5BlBS0NhuE
	wA4NTIA=
X-Received: by 2002:a17:90b:3c8f:b0:35e:5ae3:299d with SMTP id
 98e67ed59e1d1-365abcddd36mr9275143a91.11.1778181595203; Thu, 07 May 2026
 12:19:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429191431.2345448-1-bboscaccy@linux.microsoft.com>
In-Reply-To: <20260429191431.2345448-1-bboscaccy@linux.microsoft.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 7 May 2026 15:19:43 -0400
X-Gm-Features: AVHnY4K2gE6-_wPdetwQUwodb--l1vbJFrrIitihnjQHsL-gyI1WmZmW-6cI99I
Message-ID: <CAHC9VhScmOoCtoFtccJ6x_cTdwvKCBfUyg=1p-kuAGmo=FdgwA@mail.gmail.com>
Subject: Re: [v6 00/10] Reintroduce Hornet LSM
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: Jonathan Corbet <corbet@lwn.net>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Andrew Morton <akpm@linux-foundation.org>, 
	James.Bottomley@hansenpartnership.com, dhowells@redhat.com, 
	Fan Wu <wufan@kernel.org>, Ryan Foster <foster.ryan.r@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-security-module@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 3:14=E2=80=AFPM Blaise Boscaccy
<bboscaccy@linux.microsoft.com> wrote:
>
> This patch series introduces the next iteration of the Hornet LSM.
> Hornet=E2=80=99s goal is to provide a secure and extensible in-kernel
> signature verification mechanism for eBPF programs.

I see that Fan identified a few issues that need resolution, but I
just wanted to make sure you've read the expectations for a new LSM.
To be clear, I think you've ticked all the boxes, and there is a
MAINTAINERS entry with your name attached, but I just wanted to make
sure you're okay with maintaining Hornet.  I like Hornet, I think it's
a nice and fairly clever solution, but the last thing I need is a new
LSM to maintain :)

https://github.com/LinuxSecurityModule/kernel#new-lsms

--
paul-moore.com
