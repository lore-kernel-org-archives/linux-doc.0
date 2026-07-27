Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735503CF054
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 19:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179904; cv=none; b=Q7Tm/gzN1bA/oTzvKsY68/vmsUsU6LyPsqG64wElhRlN/yAXVzkUstDghfEdJil4kiLtJyp6SPtWYJsCJVCIB2fTwe22NH40QbhqAZw2KtretR4PbQGHl481lYYRU8liShkDexI8E+oLnapFyw5X7sssPNdHmoqOhXHjFxZc1g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179904; c=relaxed/simple;
	bh=Un6siYnM+ZFWlTw3zCz0AopGBG7MRAKNI5gG2PmKCGg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VvVDANJWTnOIoiVGUVzFssX6lDnaUjUg/NdLObo+Zngc8tWXHLnTkHi5Hb/ZIQdsGbgAV1f7cDBaW7JtOUQdJnroHkkz/iJnGxHLxckSs7DY5P7VklLtDrtZr1WTorsT5KXt8Ha5DlxoMVtABWgM5c2qj/dRMBgvaPcMKMCsGRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8X1akrS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8X1akrS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso23183105e9.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 12:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785179902; x=1785784702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mwsGW+Hk5uHQBqnL2Eo2zXFB4YSPa29o9sOJAIzMO74=;
        b=H8X1akrSC5bXF5sqIQcvtnldVKDHo8GqQ+s+25pMzInhmKNaU7WEA4rrLtcoIeBK6v
         /RQnSOPs/flzqFf4i8UcU94hv6AeJY3UQTIB/PpHXGoYTdspakUjDnXhv0N1IvccTFWV
         zGMr80L+XS4gf7elK5isMWQeLCB1FCkMrbBdsI4HNSxs44H8Z74qYpToCzSx0Hleo9Rt
         t614F0LiEeMmJmpzvqW3Mu4gdPTz0HSUDT30kb0PHFCCkC86SMESfLbZKN0CpVEzpZ8r
         Ytbblk9IAYJak1EWgvWgSjQpGhq8OS/+lOQVe+jVWVEJWsscbNXoAX5zRFjVv1lH/UFM
         1wVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785179902; x=1785784702;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwsGW+Hk5uHQBqnL2Eo2zXFB4YSPa29o9sOJAIzMO74=;
        b=GWJIuaFd835Hr0qOJUTJXHc3PNKJWvOuHWXLA4C3vPozPkqoFINRlE3yE4T3DEZ1ch
         E+iSomCsaHcpMaUsSm3yJzKAhLo7kwN2FYeCAtcl7P0UmlxqLYRm3i69qCeNvT1BwffB
         WQpXQKW91lO1A8hk9Dj46VSkIHxwEyMkcKvgI5umoPyCWzCUjP52EGGr0Zhg0tiQjLA9
         xZcnkZKgLtVh5DHvEhtLkq/2wWo0oZDCd9LML7PBtczZpBlOw865ioR2TitPWL0GkzD0
         +gi2uDsDPWMF+yaVx15BK6HJkVsa3iUz+05b8tWd1El1ebFJfBLd8TX9PWmIxYFPqTzs
         5bsA==
X-Forwarded-Encrypted: i=1; AHgh+Roc8xfUOVgrkI3Nmqn8Uoon1wqfynE0EM0gIJhYSjdkFk5LJpWk5R8FJOuqDF6bPNkzl1qi1Z8Si5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgDkcch8KKCZgbE0JJGTlUjeQwwQ7qO8xFEsSEWP4v3ojXTZDC
	rxPj0focX33xaPCfGgBanMUq+lELwAJbIJ4CNELTA1CU3JNtQDeLwP64
X-Gm-Gg: AR+sD113M1DSBGT56PHbDmjNPewmkIKlFWNnRlwe7UlndgVJTU0EeX9oztG5PygD4Th
	pE3/7F18dQGWSwb+lHi0NUEcUJ8DCbgMFmI0LInHujfaqtQcE6rS0m3bHMOji+oHpDrmYTQx44z
	gW53/8fKH8i6ak3MWm8e0Q2yBDoFYzyN77VQLEIA1ejarY5vAmWDCGUbZ3lGQfuKIj1eaLoTdQ8
	RWmcwrv4x6NThCOXK8MltxyCY1vDAyQ1+v3KdZPDnNsmQ5anlhBKjU96DUjYtWyAWiB/aeVYcQc
	VIYPvKJaIqDPBb9I7rljvPD9EOSC5T6yzrJEyNsD/7JmdhhzmW369+fc7yCW+MJ5cTW7x05Yr7u
	/9lMRw7+cf3EK5OvwIsWOXc+dVC/vm4sHpGB4sQdahvPKc2wzDgpdpRrSiQD7J8BSgvlqsmp8wj
	C0SS3OkvzPHmrrvVMGhFSA5g==
X-Received: by 2002:a05:600c:4444:b0:495:6022:5a14 with SMTP id 5b1f17b1804b1-496c4fe08f5mr4096005e9.34.1785179901692;
        Mon, 27 Jul 2026 12:18:21 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6dc25sm50020765f8f.33.2026.07.27.12.18.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jul 2026 12:18:21 -0700 (PDT)
Date: Mon, 27 Jul 2026 21:21:30 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, stern@rowland.harvard.edu, corbet@lwn.net,
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usbcore: Add quirk for 255-bytes initial config
 read
Message-ID: <20260727212130.4a6bb49f.michal.pecio@gmail.com>
In-Reply-To: <CAFgddh+1Bk=CFkKYNzB=L++UejkhCEcTHp4A2JL2v+P6uBuF2w@mail.gmail.com>
References: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
	<20260717195336.98500-2-nikhilsolanke5@gmail.com>
	<20260726182946.79a4ef98.michal.pecio@gmail.com>
	<CAFgddh+1Bk=CFkKYNzB=L++UejkhCEcTHp4A2JL2v+P6uBuF2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Jul 2026 20:55:27 +0530, Nikhil Solanke wrote:
> Regarding the "stall" wording, I was referring to the condition where
> they fail with -EPIPE error when these devices are connected through
> external usb hubs. The directly connected devices I've tested
> typically fail with -EPROTO instead.  I'm happy to reword the comment
> if you think that would make it clearer.

Understood.

The reason you see -EPIPE is due to the marvel of technology which is
"transaction translators" in USB 2.0 hubs. They report low/full-speed
protocol errors with STALL handshake on the high-speed bus, even though
a new ERR handshake is also defined and used for similar errors on
interrupt endpoints only.

So your device doesn't stall, it just disconnects as usual. And with
a USB 1.0 hub you would see -EPROTO too, but these are rare today.


My habit is to make code comments generic - I don't know what devices
will use this quirk in the future, so just write something that likely
applies to all of them - "break", "malfunction", "fail to respond".
But I also describe precisely what problem the quirk was meant to solve
in the commit, so the information can be found with "git blame".

Regards,
Michal
