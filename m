Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6D73DEAEC
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934350; cv=pass; b=V4OLBwB4DGGxeTVl+yqVKhKHLdk2WSjr5Bsrc7iIEuoHxftyEzdT64Z0qAkcSR9hH1CTDueBZF7UeBHJ9PXc1x6GgEncXgOG9492Y+6U7h45SUjC1PZ4HABk7IG7hL9ZSKqNF64hiSq6DSJwwGmXTWDPZQCpazwqmTLt7lVXI78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934350; c=relaxed/simple;
	bh=QjsImxEKuQXmmT3bV+BkuZLjlWzEvsEVFzbyIuMQhG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTe2+I7HpH31rntqYX3MP9U7eMmK5Jn6JMmVd4vNM6IEkBySr90MuOVWojZfsRDiHLVD7Tzs2krRoswgGfrGJYhSoDUBun/91miDPMSEfYhmlScClj1uO7LQBzsPJAqvaN36An/up/YkW9/JVkXFUuFPLgpUtr2gwdAA7GxoZJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=pUZJ8S8/; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="pUZJ8S8/"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c8f9846c8so5599842c88.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 01:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776934347; cv=none;
        d=google.com; s=arc-20240605;
        b=XEL6aHJcbapfWmXWyHLT3FWvj/y4CmgDcCzMH4LYfbNX1J+vW9foyjLurnjGRhS/Wx
         lCIje+PWhmbPmmvlOmbLz1lbBXu2SqM7vmaZ0ai1VveYTSxXHlEspe6bBHmRpBi83a6I
         yZY5Ey6cWDOMSeD+G91nKS18WWZwLD1qYWfevn0JcasabqWBRslJcCgORWf1erHW5oAe
         uw6we0rcR0euJXPzR5hx+hmTBuHEQMRebGAFSlm15EIsblMFJsWJpMClX++BZsCk+JRC
         H2XOcAJp/+Iw0mzTNF+CZyqiouMiz+Vz/LfC+wQJRdG8jURVELoNXTu+AQDDdS6AKLxw
         PUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QjsImxEKuQXmmT3bV+BkuZLjlWzEvsEVFzbyIuMQhG4=;
        fh=bIM0CZOpWEL6bN0JqoVVS2UJG/FQ9n/Ty1sSi+W9LVE=;
        b=LY0klZ4QatahAQx3YY34HjGXQATu9gv8GtRyWnBMaT+aZXLlrhuPU8c62aEz4IAZzP
         8kiqo4bG6zgK87lLW8F1iQiyrNNnjXlzXcFFokgHFxp6QlW7wWuFGR7uXLnDklSVqimw
         hCWlAKKxfEivMZmqyehPqK7AGz4nX2GsotA0YSSk49/YUywu+jeem/FA2unWwlH5wgm4
         HWcxlLgBWtQrzuBFEf00y5CJKlvLfyiYkd/TlYVH30xFTg3Au4dVR+rSt3x79+OrWkpq
         91BIBOTSjG7W5eORWxdMegszEMKy2WZsd01kG8xFYaHJnJ9My34FJNxWlKYplUmDdKlo
         dFew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1776934347; x=1777539147; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QjsImxEKuQXmmT3bV+BkuZLjlWzEvsEVFzbyIuMQhG4=;
        b=pUZJ8S8/ORkDJdutzA/cA5/yLYsm85LJdgN9hFU1NQCc5SJUIlAXiQnVE8uF778b36
         vcKGpdflRYQ78Bx1gY/J9F1WwKkMfiZNVsoF57Rn3yYSLEqp//ipqahbUhaUn43kl9dy
         AoKvPP7SYLy2t77vg9zVRcY0+sattdoMkyWm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776934347; x=1777539147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjsImxEKuQXmmT3bV+BkuZLjlWzEvsEVFzbyIuMQhG4=;
        b=oopVcu/QZYnBIl2tIMqjUzwURKuQnmvJN5Y/F+ie6Ku/HUPjsoym9Bndtxrp20vROW
         eINZnKx2yl9TXEa/lu1VH91HEWT2F0N8jT1nUSuhWA3wVSk+B8760KsqQAZCvUYeQEJ8
         toULZPZVmid3kiqTyLjN1Nae2mn6uU6FUEbsH9I+VGc0Q4MWAATIRGi8Y7AYfXVez0bF
         P0B8TJod/CL+o6vkeieKxvNX46m7qmgm+ets7hdH4ahtnxoJ1EFT/3b/h7wIi75TFGpq
         wSHUi4+uNarUaDJTkKQwO1B/l8RNV5cnjpbp45XWkKbXPd6sPknwHVKAJ+7+e5Dr4l4A
         QZbw==
X-Forwarded-Encrypted: i=1; AFNElJ/5TbZGVsAix9+Xd0MR0/QUpedFwsScOuDkR1lS2TBHh+Lfr1xR0xA280r7fqXI8yxmBZ3SNIAAPPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtzOjKJQ5n6KrTJWI8V7NLZWjzW3JJc4zTerNhn9v9xfQtxISw
	QvjQOwhVlvmSRPmJ/EHC+TtM9fv6uDTajop7XIqxhFSHmgTb8mXWm8WTk2uZ6Rn/GrvsA3DE/N1
	AWO/UaAh0IhmcAXDh8Y73HYwWVR3EzYk+ghNYuDm+aA==
X-Gm-Gg: AeBDiet9G3Thefw6AE6sbDteEzehHGwJ2DspRpNhH8m4chJv8bdAmXwFxEUw88tO45K
	pIxu83pGgRp2zPHAEgo+MtM+gvA/JDjEVIR50QiSHcGIV8RpqSgZUn65TvF/w9WtbzmLvRwJ14E
	1ibZfo8jFIMYEvfdY5f9Mi1w6fMOrUfIpgKsH858cmVXvj5BodkRJ1QnVO91eWuSRYArNcxGYkb
	+DNj/jASy10+D9yLGn+nx++bBRMsR+gRTDbytpQh1HnHoRQYBJLRbdlAvHK9qBS/h+xjWkEvyB5
	VhEvhybF9BPcNHVSWA==
X-Received: by 2002:a05:7022:383:b0:128:d4db:447a with SMTP id
 a92af1059eb24-12c73fa73e6mr14286081c88.29.1776934346915; Thu, 23 Apr 2026
 01:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422-v7-0-0-net-next-driver-removal-v1-v2-0-08a5b59784d5@lunn.ch>
 <20260422-v7-0-0-net-next-driver-removal-v1-v2-10-08a5b59784d5@lunn.ch>
 <CAMuHMdV-vF6sTvAi8kKzxGwZ9YUSBO1Qta5PDCRbA0zr-LEp_w@mail.gmail.com> <c0c80113af470b265650405fa24deefe2d82ea24.camel@physik.fu-berlin.de>
In-Reply-To: <c0c80113af470b265650405fa24deefe2d82ea24.camel@physik.fu-berlin.de>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 23 Apr 2026 17:52:15 +0900
X-Gm-Features: AQROBzCE5_am-yGAVd6HVGlMuKn48vLDnCtCy6OhnZNL7yJIJYBvslDU1PnlxZI
Message-ID: <CAFr9PXnECog56b+Jq9TBohhQ4oBB3hGV1pHj6OstOSLqkOpcTQ@mail.gmail.com>
Subject: Re: [PATCH net v2 10/15] drivers: net: cirrus: mac89x0: Remove this driver
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Lunn <andrew@lunn.ch>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Michael Fritscher <michael@fritscher.net>, 
	Byron Stanoszek <gandalf@winds.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Adrian,

On Thu, 23 Apr 2026 at 16:10, John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> > Macs do run modern kernels.
>
> Retrocomputing still is not well regarded by some maintainers, it seems :-(.

I've found bugs in drivers by plugging those things into exotic
hardware like my Amiga 4000 and Ultra5 [0].
So, it's not totally pointless. And having a shader capable Amiga[1]
is pretty cool.
Sad to see fun stuff getting pushed out by basically spam bots. :(

0 - https://lists.freedesktop.org/archives/amd-gfx/2025-October/132283.html
1 - https://gist.github.com/fifteenhex/0e5ce8c1614bcec20ed242045c11d1d9
