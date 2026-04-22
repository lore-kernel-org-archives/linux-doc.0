Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8CF265CD9
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 09:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850410; cv=pass; b=M0UDsxT8ABNVpRpAuHaLoo+7FWF2lw6KFf/gFiFHV0xJf8RAmG40M/moG8Kxr3BOtPudkcxNzWud3I7xfqiEgGOKKBAA+Zy3SzSVtFwY42bH8Z5/tcpbHXBJom2ZDxn8vr00S1WL71VGgrNWJOJkOVtP/rQL/09v0XYfmkRFmUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850410; c=relaxed/simple;
	bh=Tw2n9cXwT+6+jHxEkq2DsjVwY/8dX+aCnX6Kt4mfc8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aspfL+foo4giCXZisXY659InYIhWcbTYHa6q0VO1I47SKMaEz6TRTMdRm0WUnYlp+ki9teXY83JBHTzbjNPX7oxRK9egzX0rzVz82Z0GBlwzmq2rUMev9Swk/todTZijmlNy30RlSEzbHNlRUiGJdBIYzGvCmeS6vOw1Ko8cZp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Y28Zb+ci; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Y28Zb+ci"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12c8ccc7755so4246401c88.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 02:33:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776850408; cv=none;
        d=google.com; s=arc-20240605;
        b=WAWJxpPzYrtcFDNjgdHQWMPQ3DrHUb2jIU1ZS+SyR0ThxFL/CbLFTpBkx8jZr5yYX4
         OM+OZBuvDquMjKZfI/ROdULYdHiU2huT4Fkn6Jjstm6MNFtM3EOp1zdE848OROb2dQt3
         50uwwLhVVFoNRa+x676h/EDI8OFz6qd2w4eKlcXYjQdVQ8zD3Vdm9Sjikgq5qrgsT1if
         vTYu7mB1Fob1AsSM8eQK9ct3O6DFu6UsYxf7EXzS2XBhwbKYJszdm/V29vaLuzG8D4Nc
         smFw3o6rst55CFrD+k+UWLUsPNxZcFt0B4e3rH6Pq1DQ+VQkR2VwsVqurG0VJj0Og7ov
         iEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Tw2n9cXwT+6+jHxEkq2DsjVwY/8dX+aCnX6Kt4mfc8s=;
        fh=KMrnGNqdVlyxD4qAy6eNywoFW837lkKlv13WOzJUi8I=;
        b=CdR+LvwDrtEccb8vIVlg7wZd575L3dCWOArsTfYRRtDjpYC+8uMIQuf+X2W34AkCw+
         bWnvMLcmvUQ508RgWEUHdcD5g2JDwTJWy/F0J9TcQEGAX6j6dVYBatDz7tRjum6XoTHo
         W5S9fc/1v3zesrPVI2lZRg1o2egq5ovPIXDx05+TSUtePfUh2yv+nRj/UP4e8PZuv5q0
         bCUs/Ngf0/hwjjnQaBuhnRZLHYzmro1S9gevAGmcvsp4J7iOWoB9iA+Vbkz7y5Wvp+zY
         Gt2EWMQxWZKkSOoyNQ89YyWxvjM7aCRlJv6Rh+k7DckpilA0P3HI94xcLG8yjBu6a3V8
         1uYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1776850408; x=1777455208; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tw2n9cXwT+6+jHxEkq2DsjVwY/8dX+aCnX6Kt4mfc8s=;
        b=Y28Zb+cifTkK+KPzvQDK/u08+a/ODY0e1VfztuE9BP/AjWU4JHLYwMe15Ljoe09Kgk
         SULQXv4TKyo5XRyxAeHtZ1FWboIlMSJDumU/QIEFBQhjOG7Al+MdYneNMdNpkvcA4smL
         99cNNjmfnw0SoAkam2NQPxAz0ClEBiGYM34CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850408; x=1777455208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw2n9cXwT+6+jHxEkq2DsjVwY/8dX+aCnX6Kt4mfc8s=;
        b=Emi1IWF1HOhmueNk+ywMnu7EUZLVW54y1PwgvKrPnl9gZbPNvQbgFKZP40M1SMnJ4q
         ZOv0I//QQiJN66JQd7LzFy2RTQ6iuo+a1hUs73i+edHJizmt5aC3VrFtuwOHGXcu611q
         xLhR4vaNMsXlsknv9EVUCEe0tNDOAv/cPxr8hhie068xsvJ9QHI/zPxOIPdzc0TX5lCV
         ng8Tz2Nm/v5KfRBV3Htdz6uCqzxuBkLZA+Hoae2UG/zlLbCJo3CxADrwLvU3452pAQ9T
         yHDL/vjsDPVJKAjwLMI6MBrddZ1kOHXccYLBF+OcX92OXZYTdCPGWrpQ9FmsRUovhJam
         Vu9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8mTWP2CYFwi2NeY+PH3oRBxkQTKlQRhzGYAl5AiJKExWd8Arpkf7rkHGUZGS+MD3osyQYtLHjq6+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJzp0xK24ry0tkPDWXIij4O/K8BY6vP8w2W/m8Tq+cbvVRxlWR
	wfmN7ou6MvSAWWSS6S5t9jTlTZv79RNESgdMCbSPW+qXwmlrrUtTh6rfPx+OKid+UkZwUk9ygtJ
	mYGMSO4w+bcSiM223lLuMmhCcgk5s2i8+MxgpilmeDA==
X-Gm-Gg: AeBDievfIMNZuSFVO4F8wqTkaVZ4bmGj+JqeFZDFcqFFKUD9QIgCJULNRkB+rHMU9k6
	j3DVN3xjvdDi5q4JkbTBV8HWmpsXcqPGmyxXU+i2NZVNBOWuf+mVdmH75PLN1Fx2OBduz/06JBH
	3eO8WyKQo38eQqNsAyVngGSoAsiUuvIES/RI1sitoscwmS77v4C0oyR4Ing/ku51DKjSQlVCqFq
	f26gpSl6LBU8Q6pU0mknehG99S37Zwx/3vmZ1/nmiMv91tExgVHFYfR60m3NKctgyRxIooiIa55
	NKm9/8dNQXPI+cLzSQ==
X-Received: by 2002:a05:7022:ef0d:b0:119:e56c:18b3 with SMTP id
 a92af1059eb24-12c73f9707amr11176241c88.27.1776850407568; Wed, 22 Apr 2026
 02:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-v7-0-0-net-next-driver-removal-v1-v1-0-69517c689d1f@lunn.ch>
 <CAFr9PXn1ixyhD42OswoyGZ=W-O-oZygUGpRNm2dcAuYBNgtmQw@mail.gmail.com> <20260422101316.0efdcf24@pumpkin>
In-Reply-To: <20260422101316.0efdcf24@pumpkin>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 22 Apr 2026 18:33:15 +0900
X-Gm-Features: AQROBzC8UhBBuFYabzJQVE1x8d1ncMEmw7w3GOX43GOVwnAy_HhF7MUhgRjqthU
Message-ID: <CAFr9PXnuyb0jTAhRgJGRmdzUMxP-0HrHHHN3YpQnOn8-nBBC1g@mail.gmail.com>
Subject: Re: [PATCH net 00/18] Remove a number of ISA and PCMCIA Ethernet drivers
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, 22 Apr 2026 at 18:13, David Laight <david.laight.linux@gmail.com> wrote:

> Is marking them EXPERT or BROKEN enough?
> (Or a similar new option.)

I think EXPERT gives the wrong impression that they are difficult to
use and BROKEN makes it seem like they don't work.

NEEDSHOBBIES or LIVINGINTHEPAST ?

Seriously though, I think we should have something to mark stuff in
MAINTAINERS and elsewhere that is in the kernel but only because a few
people are having fun with it.
