Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F04226B2DA
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776809013; cv=pass; b=D+/WD3hnXfOP7V7f+SIZ7s08LiIeJ4f/TE03aDqXW+N/XS/rfwATD1/3SY9v55doMlskKtDTo5YR+OUW0yaFwhtgT7RQ1vXIjIz6ar9k0al1ABwVsfC/fejbZUOKvbGIU/f5IqbqIVTuMjkRjYfBR3115anjqxdNbMyJ1D4hMAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776809013; c=relaxed/simple;
	bh=S1NvDxDjA0nFgq85sq5CrIpAKp7K74I/oJLFFll9NaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1+UDWxW9y6smNQlLTg+TcWDTWy8HtARmHXttBtWHrVwIIfTE5mxPQGifMD431zc5dFko9kdyv1+7OaDsrDGCCrqaUefMCR0XCiq27Wa6GjvRjOLxYEUOaQqPw4CbN2L9hqEsrcL48XCaELDbL9WXP5nIm4GMTKY8lDa1OZZPsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=INV99Vzg; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="INV99Vzg"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7b186dfc1d0so69725657b3.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 15:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776809011; cv=none;
        d=google.com; s=arc-20240605;
        b=VWJchdd56fdc0cq39kv1zPr1GpIDkYEqgzQNuE6xt33vxS/kT+SvwRRBJB0RQHaqHi
         13XnlGJy6/wp9N4dijMamGmR5w0TO2hg2wiBwn9IKijqEI7+EoQsQWK/mEEksb+4TKUS
         gHEmvIvovYRW8RJEnvLb91PiehiP099+U/hLj71xe0KeqciiovZECDvNcdhz1HNUnDUL
         FTkErXgVByJkyefp/ZRcVjL4H4GzS8gQ7TWEpaq5ozr8sI6kkYS91iX/tmQPJMgnKrzx
         AJtYH9cRjiLTrNaGZH+ta2h/g7Eq3gKiU+8CK+F9qruJ61SxSbabIrujr3zjsF7XYMn1
         jYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S1NvDxDjA0nFgq85sq5CrIpAKp7K74I/oJLFFll9NaE=;
        fh=IjA+GeEyjYvCW1EW6mq3XpnIGFebkQI8QuSHIgMF/HQ=;
        b=i6unvYSZpk1iYmfBE3PtDiGoPiiqX9eZL78v8avjgi5qMHRKjlUbOeZp4nMcZdoHqU
         megTPi/dUfKybeNH816Dfhnd/esCEhA2s9Wd74qDJUS89svRNdDvaxZFf8hD0rsH5dN/
         7OlzmxwSN/lGsXPS0lB1uO6ATDlP39HScTSxBzZkMQeqV9X5rD6aqulfbzUj+ZjmMA9w
         3i/NsNSexwevztYEPAlVieFpbHe9vbNP9861OVfqJxgVq2FQgiRUpR+39EBtm88cnked
         JLfOqT1xVsn7p1/f8YzMwwkvEr4/YiAm/dQse0BqfJicavT+Rauu3PyYAC7NlWBLfvBU
         36Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1776809011; x=1777413811; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S1NvDxDjA0nFgq85sq5CrIpAKp7K74I/oJLFFll9NaE=;
        b=INV99VzgByAaUC4GU5Vg3Eje1DmWoocL/5KcNXcuQWZuunrAIaJCdGzRqpNWXJj28l
         tJRkGCvXjycgnEiAr4CZs5SiTA4Pv3nQmgbZP4vqamrvchIp475Ll5VPTFnvHFONZIu4
         yUOFx9WsgJYgn/P5t929dLgHsNasDmXGHQHYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776809011; x=1777413811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1NvDxDjA0nFgq85sq5CrIpAKp7K74I/oJLFFll9NaE=;
        b=oSwAFZJt7NEPAIcTUUOMXSi8vA8cW1wPCnQl6I0AGD7kQ5yj0XrrHbxYDUBndamUv7
         2uzQMNKZIJq4cgQ+Z/mgc0/7OfBmhxIvojVDNeMhB0rM3ohZlBRo3rxhOFzsfQtXD8uU
         2o0YiP9qHyfhdwjfE5j5FdF70BTG8ZJ8KrDAWiHEM32VVJ+1axUo59SlUBQbFBJe7kvb
         yeVNPX0RamQy+bq2DwkoyRrLRq5XqpSbsgtakkt1bgYj+rDUw1ONA28VQkIC2hAmzL+1
         NZ0xLfqxt3y71LZZTwILa2cUuR7QyC0MsVEAYnm48ImBI8woVraPn1klfA1PB21mAZix
         gnVg==
X-Forwarded-Encrypted: i=1; AFNElJ81iPBO7bXKLOUFuUu0DNbZIz1LopWwEckQ8dyIU5Ymr8/EYJlIVTOQ1tJM4pFjTJj1+qjvNrMHBYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1DvYt1XpqYkk5VpagHpXtvSW9eLoMGqSYUPSPj7F8ptqoUxdx
	7IlPdI+f6i4g+323Ou0oX/eytTQxYUQX4SIVboRcgSsas+v7QHk0hqlTg/Zzetv9Sty4qCp8m9J
	6VxtwFpLYMdER5tbokekEX7JovzEvLjVOio42dqqwtg==
X-Gm-Gg: AeBDiesEkQsqoouO7A31eZTcylLDQvqLT+TPKMVIUxZhgPZdp7qPFN5ty4VbYiyQ4iK
	J/XwrkBRoQ0QzuixG8i4ftkFDOn6a41j0zpGBoB62hIXpPZnXNQ4Cw3Rc6qcXX7CUZVXofcNBWU
	NVz0wtSzsmOyJY3eMxs6wZujQwfyN3Jhi1RSnqqWef2CjlXXJRDYuZ+BQttBWwihRVESzKfKlv/
	VePGHY33mWR2+WoLLjzv76KFI3+5ti5kkI4PfKB/Lo/BE4AiWfouD4/5kJlLYhKKfeF78FPNTS5
	MStMsQNDaoTEu/AotQbaqJ33msiAOLVdU4xAMj8ejXcymetc5cI=
X-Received: by 2002:a05:690c:e3ea:b0:7b3:8a18:ba7a with SMTP id
 00721157ae682-7b9ed41801amr154062417b3.17.1776809011367; Tue, 21 Apr 2026
 15:03:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-v7-0-0-net-next-driver-removal-v1-v1-0-69517c689d1f@lunn.ch>
In-Reply-To: <20260421-v7-0-0-net-next-driver-removal-v1-v1-0-69517c689d1f@lunn.ch>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 22 Apr 2026 07:03:19 +0900
X-Gm-Features: AQROBzDi0D4-VCfdphZ_nYuolvWfMt6mc0SBnOeI3WNiElqSLF1z65Owh0tseBM
Message-ID: <CAFr9PXn1ixyhD42OswoyGZ=W-O-oZygUGpRNm2dcAuYBNgtmQw@mail.gmail.com>
Subject: Re: [PATCH net 00/18] Remove a number of ISA and PCMCIA Ethernet drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Wed, 22 Apr 2026 at 04:32, Andrew Lunn <andrew@lunn.ch> wrote:
>
> These old drivers have not been much of a Maintenance burden until
> recently. Now there are more newbies using AI and fuzzers finding
> issues, resulting in more work for Maintainers. Fixing these old
> drivers make little sense, if it is not clear they have users.
>
> These are all ISA and PCMCIA Ethernet devices, mostly from the last
> century, a couple from 2001 or 2002. It seems unlikely they are still
> used. However, remove them one patch at a time so they can be brought
> back if somebody still has the hardware, runs modern kernels and wants
> to take up the roll of driver Maintainer.
>
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>

I replied to the single patches for the ones I think I have off the
top of my head but maybe I have a few other these.
I think on x86 people running machines that have real ISA slots and a
modern kernel are going to be fairly rare but I think there is non-x86
hardware that has some of these and people are still using them.
I think the pcnet one is used in some PC emulators too?

This is just my opinion but I think it'd be good to give people a bit
more time before they get removed. I thought I was the only person
using the 68000 (a cpu from 1979) code in the m68k tree for years
until out of the blue a month or so ago someone popped up and asked if
I could fix a bug in it since I'd fixed a different bug in it
recently.

Maybe we could add a special thing in the maintainers for "this is
code only crazy people use" and have a rule to ignore untested AI
generated patches for it? :)

Thanks,

Daniel
