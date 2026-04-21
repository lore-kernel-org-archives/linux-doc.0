Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2448374E7A
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 21:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776807522; cv=pass; b=ToPdy/H5UxM1Y2bcl7MkrpPZSRFwS3Mbcc/geVoFd3flzcJ4ojBugjm7lOy8t7rQKeJCsBhQ+xHfGL9KddZ85vmoYQ7tqMc1zM/iKYeU5VXdeVX5M69NbRb+OIkdYv+VLCH+MxwzDuHq2TY/MOfWrYOEpHiioD/Nw+fdBD/3qzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776807522; c=relaxed/simple;
	bh=4H5MfuuLuxO52z3NVtk26UIyVBH5568btUcTZQrH1rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZRdZY7ZT/p7HSuSkn8Xpcy5P4EUNoXFr6UwU6FxuRXYn6gn1SX/YKwUNh1taRXQU9d1ZgviBKFXsgWgOCLXBuwl4ajzIIok+NdUL8XCC/kJRvWMaau4UEuw401sW6zB3H3cCM4NrNWN014vZKKqUfUwBQhhaYjp9cSpbVlE9xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=Y2nYGQeH; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Y2nYGQeH"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7982c3b7dfcso43547557b3.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 14:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776807520; cv=none;
        d=google.com; s=arc-20240605;
        b=bL8yaDc7+3YOCBugJIpPVzgwD9A/gslcgOwt2PrAprtngX1PsPeK1JklRL2YigR7D4
         FYhEr4ogLijwe2+/FiohflKycLdytPMN3wQ5vfox5rmig+TnPcf19cOd2Kh4tCug/H4u
         XKf9dvx3x3dRL96CO45HARAeXmWCFFPD+MhZYv6JIKlzRe/VDfwlt/NoG2LwIB84ISXb
         XSrjraENOg6OIdoBjKGdbv+od3NXwmh0Ca8fJydNvU6sIV8QYGY3nAGg94mpUPzNlEWR
         O+t1WB6L8yo154hV7Alma5JEDOuZIsmjb2LYF+bm372PSiIq79MofY86M1ulxLU4Etw+
         5BQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4H5MfuuLuxO52z3NVtk26UIyVBH5568btUcTZQrH1rs=;
        fh=IdyTnGTDfFw1dkNx94kgxzHNR+8vi4HaMZuj1X2KjdE=;
        b=R523y1LHGdLSkeM3ZQPSekE3rrU4k3QJeX+BNnw0gR7DfTLNNG1gq8n+qXMfaU/ELt
         PW558U0J475qFI4TvY35FHvV7YmU0vI0j02J+K39vz1NJm+DAk8FsrYmWHieicFnMgJ0
         GIN9L6EMRGKMs0WFPoHqvUg5ccEA6ZvdoO066j/NCV/p3Jw97q+Ma0n8xN0T1Z57pG5a
         Ff9MbDofStXineY8XEtIUwXI7W00KmU0nYM9PTxmmpQDJ259Qmqa0mfGLAZvJnMVhxAc
         UVPb1UjwnP6XkRnn14aLtO5laQPSiYx16gNGgcSa5vjcFzj/CwzYePI2SKL4LXmRhY+G
         H5ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1776807520; x=1777412320; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4H5MfuuLuxO52z3NVtk26UIyVBH5568btUcTZQrH1rs=;
        b=Y2nYGQeH+SaPkHMR5sRtnnMnGi6TRbq+VzFvFbvyRn3m3urD9mTRrnFYlEzaES1TO9
         ggSwqV0hWp/Tn64oQtKJKo0p+Dp00SB3Y/x8jy4cqTNcMjX9tfHHJk3uz1/EhLjU0RC/
         Q7Ly5Cks9VqnUQN/uKLoyW9TVWo/IFYx9x1+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776807520; x=1777412320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4H5MfuuLuxO52z3NVtk26UIyVBH5568btUcTZQrH1rs=;
        b=eulDGdg7QkyZuz1aUoHhNbckYZbh9ZdxUFZJzeKkBkQJN6VfAqhsqo0jgt6/0KrDQ+
         aPPeAkFeeJyQxvzURgJOLyOQgicQoGuggvkuFNdnKuodpOLTTpfG93TmvnSkuZ1JI+/i
         TDocaedcKNfSI151yAPAePBK3S7J+j9dJvF0/5Nw+pVFRjJin3FXlAVZrH9kY8bNWLf/
         i7wVU0VWYeRpEg76ySIo7bDgHh/cWLIg5DfQAAYDiYxV7QuRn65tZyaN5e0lyDenMHvd
         l2XSAemjZZUMXLsT7DS6fuHwZKZnjHXTZATep/WiNp0oxKvQjAv1JxBMjKV12IZeMy2C
         zUFA==
X-Forwarded-Encrypted: i=1; AFNElJ8jjrGGBNMu/BW27jQH4sE5AujPCMGM8+GcNnodu9ACUjhJi5b6kdfyhTUn35U+8DagjX6jrChoLaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwf2AXH+d9Ewmqm7jQOfPLRNtuy8Q02fmEbFfi5HtO6P90ffQ5
	3KOdqYXKGkmJKd/Ba6LkAllmIyIUdFOjIGeuQa9i8QBm/W5HFTB8Tp7Fp9LD/a8CFCam5AS+DsY
	sWcn3z/M3JYOZIo3VsXK9+nP12Ha3OptqOgklYVCkV4W9neAKFZu/
X-Gm-Gg: AeBDietm8oZ8OEXBblmxloD1S1UpDDO098eyv2x5PKJzOv6oGBIkfAM8MSzLslAm9Zl
	HAfH88eZxs/aMOPBY+1BINZ8xa7imdHCnPxRgPZcLJ00ix7AD6AurgRkc4PMlwDVqH7uj6SmFh3
	rChQsZEFSW2pzH86D2mlq0cziulyz+O9rL0BuaqNK19dGtaX6+LYRnQiCYRQieYoQ9rjf/JfAg4
	Fopzk5KHhANRGIoB+y2LJ4J+i0WDIP5bAGvmmGehZlHDX5iiMUC3sSmrZUZVTohd7licj8gqpVY
	zx7ES50YQzfNgDNEt0Kc7REIz0gTxasGvultdqaaASyg0FOOvT3fv6vBx2yY6A==
X-Received: by 2002:a05:690c:34c9:b0:79b:73dc:d30b with SMTP id
 00721157ae682-7b9ece5abc2mr183704767b3.8.1776807520008; Tue, 21 Apr 2026
 14:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-v7-0-0-net-next-driver-removal-v1-v1-0-69517c689d1f@lunn.ch>
 <20260421-v7-0-0-net-next-driver-removal-v1-v1-6-69517c689d1f@lunn.ch>
In-Reply-To: <20260421-v7-0-0-net-next-driver-removal-v1-v1-6-69517c689d1f@lunn.ch>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 22 Apr 2026 06:38:28 +0900
X-Gm-Features: AQROBzAja3cUhpE_F5KhNE5qp_Vgfi7Dt81CqKo5JPKodn_l_SaymiCTWpB-riM
Message-ID: <CAFr9PXk=3md2oVDqFbmQLNiVMkRr32pHMPNSeskdTpM-1huB=A@mail.gmail.com>
Subject: Re: [PATCH net 06/18] drivers: net: amd: Remove hplance and mvme147
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Wed, 22 Apr 2026 at 04:39, Andrew Lunn <andrew@lunn.ch> wrote:
>
> These drivers use the 7990 core with wrappers for the HP300 and
> Motorola MVME147 SBC circa 1998. It is unlikely they are used with a
> modern kernel.

I have an MVME147 blinking away running mainline using the mvme147 driver.
I think some of these need to be CC'd to the specific arch lists so
the few people using them get a chance to pipe up.
I think I'm the last person to have touched the mvme147, I don't mind
being a maintainer for it.

Cheers,

Daniel
