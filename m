Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF57E555
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 01:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742432472; cv=none; b=j3dOksiIB7QChmUvgc0QpIAWnAf/iYnX4+JYZGycX97Lg7+yjeaay1L3Qaxf/GsdGPQtFRGNAPSOVK6vApOIoyPqTX71PQUnUNx30RTQJb1/ao/1Y7Q+gGjVDD5d+O5NpUb/UQq2fESYiy4YRFcnCmnTzvKqAIOpdbhKPRFctTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742432472; c=relaxed/simple;
	bh=II2U1RHQ/jr4BI0zGRltHv3SonmERB5EJHALDWvyq9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O9gw3g5S80L9lCorx6sdz4NRfu4LVdxHitvH1U4sYet5Bkree+4lLzRgfj/LI34TyxgatA0Fe71rrV11lrn9li5Sap8WzlUISKuDtCV6jLT1/hKRVv10FMdX+5LkjOYykbcJ0KC1zqOeBasNM2nmjCz6zMfAo6zIezrKkFyfe9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSGv224Q; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSGv224Q"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e4d50ed90aso402869a12.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 18:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742432469; x=1743037269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAk0kapKS9PdluPJPIWkY1Z5efMx+hLqnhDZC1SJLRs=;
        b=FSGv224Q8N9DNA1zdh+hMcWAPbkocl1OylyHSzr5GQt7sbO0Q6iM+fCdgU+toHHMLV
         TScW5kMXvBOzJGsQI1BUYtChAbNrzvuIyVAYyP4F1myVti6GFum6RX04vyADA/osCEou
         7NdNBoyaR0Nfc9TocJKLL4fHurGhVBQc/SzrdXfgu+lT/x/L2bmBz5aWjeA+jrdlILNe
         BUWEwwW5tOADX1x/hLTXRngNViNvuSxhfHp1aZka+fmHrGo5bIXqhIFRdeIhA1zCAbT1
         WFZtQ427l+Tx9qRDUrb47MIaZAOZkrYYgtgdouafHEaLHTq3djzZDQe+YLk64YNQ3y+O
         4VCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742432469; x=1743037269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAk0kapKS9PdluPJPIWkY1Z5efMx+hLqnhDZC1SJLRs=;
        b=qHVKl8yCMQVn5/9SsprNs5F/2nbAYyBYvDYiBihfG5uRd1YpSdf+q43giTnARqWL2W
         deGuwLWppx17yG8Z/0bKnmtKILyifxOf9aagesl1s5c1zuTlHZ8XS52Debp45LedNm7a
         R7d3Fg9rFrw+WCQhIrgQETopdPEzX/fVlEspwA59MPflrHty54XVSKaolR+Ca/0W/DRz
         7NEfSfyKtvMTCEo0N7L0JqLwh4WxMCumlWC9tXaesOKay4lEdJTZFIwqLJWFE4jmro1k
         JpsxGkKICc/N3BymGFCHtPuZOaby/HBKxJcgEHWTZJv8IM3KhOB6JBa7ILzkx2QXdpPR
         zi8g==
X-Forwarded-Encrypted: i=1; AJvYcCVexrX9xckthfm2Rk+eiTSaXZlhgXVH5dnE/W94GBKmYrlJTJJh59mG/BwrzHMMTArwNGYW/nfsf4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtdZoO0tnSvAOO/tOCbi7NKbZBDm6FXbqT+go9/dm2N8u5F2T9
	sW+VHcaqvz51j7qN207sa7spZDSWVRYNH7JR0JnL7AmC4g3Qhw0/VFylfNCgNFIRNu7To+0mWGl
	NhmNif7KgpXJQGeMFTVuIr48uKkYTrg0DQdc=
X-Gm-Gg: ASbGnctcu6MPIGBSBG0h6cDBR8S8w63UHM69PvOb9qZwViQV4qn0dKf3xvzE93zg32J
	uQDcvjNNig0lOyVnMq9j6z13qUQ2avjvzTrlfgbCqCc4ZhZTV1eP1FFCaym9NX27T4xuuO82Nsd
	ugYh0QnXFyBYV1PBKjGerS1/mSOQ==
X-Google-Smtp-Source: AGHT+IHXlpA/PMdNofoovtEr+pQnhs/su4QQ7j9VeE5ahap3eEa9uT9nBwzui8z+w5L5Ct2JgAZ19cpecxACakhXE04=
X-Received: by 2002:a05:6402:d0d:b0:5e4:d4d3:569d with SMTP id
 4fb4d7f45d1cf-5eba00bca9bmr937434a12.22.1742432468285; Wed, 19 Mar 2025
 18:01:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318062957.2120-1-alexs@kernel.org> <875xk6crzd.fsf@trenco.lwn.net>
 <CAJy-Amk+M2OVgrRp8CUXssX2XFc6ciKFMS1iHLcyLNZ5Gm4fEw@mail.gmail.com> <875xk4al8c.fsf@trenco.lwn.net>
In-Reply-To: <875xk4al8c.fsf@trenco.lwn.net>
From: Alex Shi <seakeel@gmail.com>
Date: Thu, 20 Mar 2025 09:00:32 +0800
X-Gm-Features: AQ5f1JqPR3dnm3imqGi4Gq-OdqkWevoBcVqJiFj_zxBhE3fd-JdaDEVQGU992Us
Message-ID: <CAJy-Amn=s+sBvDNiM1n6JOK8Q9Tf9twT7ka4v9qrkBbJqdJpBw@mail.gmail.com>
Subject: Re: [GIT PULL] Chinese-docs changes for v6.15-rc1
To: Jonathan Corbet <corbet@lwn.net>
Cc: alexs@kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jonathan Corbet <corbet@lwn.net> =E4=BA=8E2025=E5=B9=B43=E6=9C=8820=E6=97=
=A5=E5=91=A8=E5=9B=9B 03:12=E5=86=99=E9=81=93=EF=BC=9A
>
> Alex Shi <seakeel@gmail.com> writes:
>
> >> It's a bit close to the merge window for this.  I could consider that,
> >> but I really need you to put a signed tag on there and have me pull
> >> that.
> >
> > Sorry, it's my fault. I thought gpg guarded gitolite.org may help us.
> > Here is the new pull request with my signed tag: chinese-doc-6.15-rc1
>
> OK ... I had to update my keys, then harangue gpg to actually trust your
> key ... but it's done.  Congratulations on your first pull (and to me
> for accepting my first one :)

Yes, a life achievement for both of us. :)

>
> At this point, that definitely closes docs-next for 6.15; between LSFMM
> and the merge window, expect me to be pretty quiet for a bit.

Yes, enjoy the peace with the coming spring. :)

Thanks
