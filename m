Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F968F7D
	for <linux-doc@vger.kernel.org>; Sat,  1 Mar 2025 17:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740851408; cv=none; b=HWgOfyg2RAibSXTinKMh0c1QvGwUGA/DlEy8mmXq6HSS1Dnjzn3CWXMitRKywRZHk4B8mYUyhFFTBkGaZexxRcgHY7xZ0j3NnrnKbf4R34xhnbFsp/P+Be3bB58E1rlJcYN0Ivw1GD4HeuSWWVmCyjEZ3W404466H/jbTkqWaQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740851408; c=relaxed/simple;
	bh=zSKc7Pg+IpNn8tUtIuCP72sDfA9owXo9Bxuvhnb3lvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=uEMrq5mhbB0NFUoCEEI7q4NDMkuQrf4dR9/rQFFxMRkcmnYUi6pLgEq3g9kb6nekWNxc8m32rqc1MyhTGgU/olCWrW6xhdu2mKB5MWt4hDdnwOj4YlzkdCnIYz6kPJrdHBewDQaDsFbIzK21pMeU4bsIAge7jVARHmeONHr+Xaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kbw6iVdN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kbw6iVdN"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-390e702d481so1337401f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 01 Mar 2025 09:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740851405; x=1741456205; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRlSIioJyCuoDXPghdd16LuuIjHfwtgCy7PC088tbJA=;
        b=Kbw6iVdNRaWCxcVDvLPeJem5OF+5Vk6GbuqPXRPRLps+f1I5H9o6ChVJ2I6xlDMVaE
         3nTqMe3JlkTsNPcnZUDECkW71/okkisgqaTqaIUBldv1OYjNLxbcuZBLigYfc6XqhPrB
         F83YmlL7RRxgut9XAGgw9yuxqgfl+yZFuyrfpAq0/trLFIuZpdTjmDjicMlF9Tvku8X6
         GODPidFVKkk21sbHSD9qeFpEAnr9S5CtK+K/0efb6q1wcAWUjh/nYVWnHikElIN/r9c7
         vx2L+j+stdx4JNwbzSFokVZ92YH66n0UFa3DxlPMSqO5MmvaFmvLXH5nVLIMgDpLveng
         VLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740851405; x=1741456205;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRlSIioJyCuoDXPghdd16LuuIjHfwtgCy7PC088tbJA=;
        b=uSwZQXPRNcsaZbsYLBcPut/cyvup0Gdl1daJKAoO+5NLN5oM7gNfxB04aEFIQKu/Nk
         fclxCTWeuVyBHllf+S9rxjUGJTkPcRryl/3rhZb0yUxlOw5ge55CP67Hh6pTuXIuvLru
         wRp3tgo0HmjUyO0jDsT1gaf8WFl1xr18EE59t21AlMlmdoZPmemsdg3yg3iy91LgJU9r
         FRJ8rGzdx1eqPNIy4Tb+KEJ6yUmU0W1yyEsvpvfEExcvEcioFwbBBBJRuY1pMarpMwTS
         Vmm7RQXstydhPxBvBPMK3lK6OCwllWukDkro2TDm2ziAaqVQFLwux6W03su+8lkwr3Kf
         BQow==
X-Gm-Message-State: AOJu0Yw4ghFQj3jW627ybMLR8UcnSwi0Av+/vJgas5YXAenVePVbK3ze
	qQfk+4h9yPcts9TzPS2qENEFFq6DClYHMPBJARwnZPHAXxBniAKW6knhIOuKahU+Lqt1jOP2/Uf
	e/2ZvT7pWR/QcRPAdLd4KeqWg5PV8c0OKzVXXscqY
X-Gm-Gg: ASbGncsoa6G348m7/Lg/evXxjhrTy4p3GZyjHt7A/OOISCs9SOJcW+ggqUCfbCuUKRc
	4xECEGe9RnvP8KByuG0b4NddfGjxjtcTS7gs6HcrPF9owz1d+yZLhO1rEiYjSEvdt7togtdNHJc
	m0z7WT4EpFdlpDot/ZLrswe1v/tw==
X-Google-Smtp-Source: AGHT+IFKO4MHl41TMf/Um4cOWRfcUb15hCFOElluqcJkLsDpGR7QcYCtdfrkryEW7AteO7wXcvNY53X+HNwwt57SVnQ=
X-Received: by 2002:a05:6000:18ac:b0:38f:3f65:2ea3 with SMTP id
 ffacd0b85a97d-390ec7cc348mr5548416f8f.17.1740851404611; Sat, 01 Mar 2025
 09:50:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250301173717.68594-1-navidmafi2006@gmail.com>
In-Reply-To: <20250301173717.68594-1-navidmafi2006@gmail.com>
From: Navid Mafi <navidmafi2006@gmail.com>
Date: Sat, 1 Mar 2025 21:19:52 +0330
X-Gm-Features: AQ5f1Jq_3PfhIjd7p0614PjQiAAqeCQBtXT7HLiUfAcln91IBWXDj8NatuIVOIY
Message-ID: <CAJKyiCOhHSSqGCv8aKVkueS9UsdM2H4HtuARDuhdtcs0-4bEgg@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Clarify S2Idle is unrelated to ACPI S2
To: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 1, 2025 at 9:07=E2=80=AFPM Navid Mafi <navidmafi2006@gmail.com>=
 wrote:
>
> Clarify that S2Idle corresponds to ACPI S0ix, not the ACPI S2 state, to
> avoid confusion.
>
> Link: https://uefi.org/sites/default/files/resources/ACPI_Spec_6_5_Aug29.=
pdf#chapter.16
> Signed-off-by: Navid Mafi <navidmafi2006@gmail.com>
> ---
>  Documentation/admin-guide/pm/sleep-states.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/admin-guide/pm/sleep-states.rst b/Documentatio=
n/admin-guide/pm/sleep-states.rst
> index ee55a460c..8aeb33268 100644
> --- a/Documentation/admin-guide/pm/sleep-states.rst
> +++ b/Documentation/admin-guide/pm/sleep-states.rst
> @@ -43,6 +43,8 @@ This state can be used on platforms without support for=
 :ref:`standby <standby>`
>  or :ref:`suspend-to-RAM <s2ram>`, or it can be used in addition to any o=
f the
>  deeper system suspend variants to provide reduced resume latency.  It is=
 always
>  supported if the :c:macro:`CONFIG_SUSPEND` kernel configuration option i=
s set.
> +Despite the similar name, this is not equivalent to ACPI S2; it correspo=
nds to
> +the ACPI S0ix state instead.
>
>  .. _standby:
>
> --
> 2.48.1
>
Many thanks to corbet@lwn.net for the guidance=E2=80=94it helped me get thi=
s
patch in shape.
