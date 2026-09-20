Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812412F7EE4
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 04:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789876898; cv=pass; b=txTqgVMqjD61OvNcB7+Zzwpf6E1jNUpEzcCZninaLz+ZkP9cbTWpktQRQ+BRijv4uO4pW01v7iAKr4LVUF8pcipu9OJJRcM5PueDLScYUYzfUQ+xU/A6aEsdmdHI+wh1wM3mk5i1oQADLdiYOQHXUfPjgpt7KQCVqd5Pj0icqNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789876898; c=relaxed/simple;
	bh=8MRsJ4ym5BfLS+pI4d5slk5a3DzlZM37ogJ96KDiTjA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dGeFJXc2t87H8vXREZ1MckuajpvWlZQpKMtlPsHY7w/Naj7weEGSsEabgjFyfoMjqPZpruRtOgO8ad2rn0ap3fkhvPzSG6b8zgCidYumucJM6/2DJeAtzFPy0j4C7eSe318f8OEkCJHitvugBalHhn3gWWgxeP4yf113PTxuJ/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oukYNOiT; arc=pass smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oukYNOiT"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so606653a12.0
        for <linux-doc@vger.kernel.org>; Sat, 19 Sep 2026 21:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789876897; cv=none;
        d=google.com; s=arc-20260327;
        b=JvUOLwjszQT2BAYBxPdKhDNaZf4JMcFKT6dp3s5lXWHT0eOcS/INEcfg8fxOCG9/Tb
         aMXAa5gmrWocd//l9YytbIcvtAhssll6U1LfVprsVYVifZ58H3Jkm1ufTwU9IJbOmLZ1
         WPLq+oagsslroNYY4xc5HJPTkxU4FPg9Uw8KO3xfRnk9cT5m0eZmqaK3z3XsSbHPcOyY
         CkNoj6CMMVhg5OioENYFO4sVNCNXDLyzMfEF3hsDHHZ6EKv8TRj4HRm5flABj2OJq5sj
         NWd5+MRmjLAlKExfgUmNLrK5QXYF/zPEdgRX9Y9b0w6onWaq2gQpF5DmrUU7QKFCj7VA
         AiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DzSJZtQqS8qgid4iKiRla6YWv3q35ndUXzYa83ma450=;
        fh=Lw+igGa7ceN/71lLZCtjtIgy+JBYJaL45773+rSgMPo=;
        b=MP3+9jQXcxbctRIhh1+qJd/zEGYFHwCdK3A1YPe15Wn8x2YP+Mh4PZnPjYUeXBiIb0
         e4ctkhupZdxU5WVBljokh3PR+H4Fjoh7AvbQ8q29dHaTjtUDQbHo5e5WoIrhoDcqKZDm
         ygTArVSllR5gzAZ5iEwPPYZlprjdyqApY0ZzHFDrwgPGJwJU7cZR2gJHD+5YTcK0XYfe
         Zs7vTnLj0Xhh6hiOXjqSki4QLPlAcxwzl/EP/ByWMe9MAFuNykyGWa7kKQM9S4kQpzb3
         ZdMGBi3KPL01kE54HUq9q5mQqHPsl8+GVRkYe/jgTn3bunQeWF4tliN/49G2JRHqN/4+
         IQ+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789876897; x=1790481697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DzSJZtQqS8qgid4iKiRla6YWv3q35ndUXzYa83ma450=;
        b=oukYNOiT2lGJIwhN98PhBCjlGi2afFMHWaR4BmV7cRi0jlz+YuFpYfnqkwH2fzParu
         8kraYOC+3pkCMMjZ2hZ3HyXQqsVI0B3Rymz0m+Op0vYHqVRZebBe04lr3utC7n5Dwo6Y
         /wvp0uhmDaocXYqVnIdqa6PYkQNCoj/PsEGB7pMci1dr+b5Gb9m9ppwyS0Hs/dFwLsu5
         ZD2HHlr2z/RYModYKS/j08ZW//6cpnTjJKnkB1eEaQFkYCJur86yTnyJ3pTsA0xQZDbC
         6IEGE3AcUFwRzG4hQrf5RvfzvkLChDRoXpKc7qyX4GfaG9uArK8X3DoZt3OgQAf8kLJz
         Cxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789876897; x=1790481697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DzSJZtQqS8qgid4iKiRla6YWv3q35ndUXzYa83ma450=;
        b=1Ggz/fmimmin+f9xhd9rD2t8VA1xj6CsJEzzeM2/CSLUlbuJwenDv2AGrWE5SmfepX
         UFkFSWFP2kBeXaz/IS6WwBDYuaGF40Eh05cyVzud5vvsUuv09HdGApbc500h4eCYPcky
         6sUhOLri53pfO4MYigEjMBdNCMLl3Klg5rCR3RuB53gfyHkoqrWx7lvdmQ9p2grVp3/n
         ZpzggUNUNJlFm3qDae71ZkwRFw2BeNvt/jw8DVqckfBgzkRWfLNPRXQe+WA/7VYOOSed
         Sy0L9NyrbpGN95OhbpSu5UZVLWRoXjfmNutrhhp97LCGOhJtoDFsSwgTW9mAAXTO9c9N
         ovRA==
X-Forwarded-Encrypted: i=1; AKwUvBxxst+NqgSeDgfKZ0shHpHUchFSYwXHu+U6Mk+n4rSBI0cZFswGUK1CzJYNOadNbQfePlr2aZkZfSw=@vger.kernel.org
X-Gm-Message-State: AFuF++nmCEV3kxkhar2H2/mc+bHMxqQJKGEmlxvjeemVRns28fNkmIl+
	HDWeKuXtDN7FK/zrZspu22x9RMaqYlTyLXjHualtfe7/b7SQesRcTvgyRa5W+5/8+NeqtXOg8vg
	amb/7wztCOE1l04rjtmezFzTmOBJnH5k=
X-Gm-Gg: AYBFou0n0ZbZEd8gx2sL0rSee4EAtWlQTYuNfvM9FjVg7cV/tHMXhwTeatk6xpejxo8
	LYxeFFzyA8M8j7p31CgFVw4lFdo3kGSxMWVBcs+Cutti2nhiiu8E89p4rrDsAmh0Iejl7beVmux
	+qtE7wbn5BxXIB6uF9nkAztlRPsQpq/v9LrGsA6nyAfmNY0j9BLDv92S+zUQ1KDM3X06OsErdq3
	lgz/Bs+4Iw0fCUUDqo7iweFR9JRNHGTQifkfwzbT7oz49d9m0BhDTvItjwQMQxVnxj6g02cnlyN
	1mYxupUYuWE7dctIHbxlNlA9YF5gxYR//X+nPXH7CHUGh4Z5ExVd5X0wRqsiqO10GALTsILcbRZ
	qNgtKDP7/UREJN73F1vX4kbEglfObYVblHquW53sv
X-Received: by 2002:a17:90b:4a11:b0:39e:6c68:fd93 with SMTP id
 98e67ed59e1d1-39e6c68fef4mr3902020a91.40.1789876896633; Sat, 19 Sep 2026
 21:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789753020.git.kimjinseob88@gmail.com> <499ecb38dc0b58b979ca1f38d2d30b4ef56cf825.1789753020.git.kimjinseob88@gmail.com>
 <20260920021420.5a13622f@jic23-hlaptop>
In-Reply-To: <20260920021420.5a13622f@jic23-hlaptop>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Sun, 20 Sep 2026 13:01:28 +0900
X-Gm-Features: AcwNN1U3rQwmlJbg_g4DdTUrrpMfiV8bKNCMI7xb5i2BgcHIced7B7DCzX82g08
Message-ID: <CALMSewKJ0ejyGi3KFb-uz3Lp1E7=8RbrYpOzP9z8-9yk8bnBUw@mail.gmail.com>
Subject: Re: [PATCH v10 1/8] dt-bindings: iio: add Open Sensor Fusion device
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andriy.shevchenko@intel.com, linux-kernel@vger.kernel.org, 
	rdunlap@infradead.org, joshua.crofts1@gmail.com, u.kleine-koenig@baylibre.com, 
	julianbraha@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Sashiko raises a reasonable question about what you'd do if it turned
> out your current OSF GREEN doesn't quite comply with the specification
> or needs some additional quirks.  Does it make sense to have a more
> specific compatible with a fallback to the generic one?

Hi Jonathan

With that in mind, I agree that a specific compatible with the generic
OSF interface as a fallback is the better model.

OSF GREEN is one hardware variant in a family of boards with different
hardware capabilities and configurations. For example, GREEN does not
include RTK-GPS hardware, while another variant does. The firmware
still exposes the common OSF host interface and runtime capability
discovery, but the underlying boards are distinct hardware
implementations.

For the next revision I'll describe the current board as:

compatible =3D "opensensorfusion,osf-green",
             "opensensorfusion,osf";

The first string identifies the specific hardware, while the second
remains the common host-interface fallback. Future hardware variants
can get their own specific compatibles as they are supported, without
encoding their sensor inventory or protocol version into Device Tree.

OSF0 and the protocol major/minor will remain runtime wire-protocol details=
.

thanks,

Jinseob

2026=EB=85=84 9=EC=9B=94 20=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 10:14, =
Jonathan Cameron <jic23@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Sat, 19 Sep 2026 03:24:39 +0900
> Jinseob Kim <kimjinseob88@gmail.com> wrote:
>
> > Add a binding for the generic Open Sensor Fusion host interface.
> >
> > Open Sensor Fusion devices report capabilities and samples over an OSF
> > protocol stream. Sensor channels are discovered at runtime from
> > capability reports instead of being described individually in Device
> > Tree.
> >
> > The protocol version is discovered at runtime from the OSF frame header=
.
> > OSF GREEN is a product identity, and OSF0 is a wire-format magic value,
> > so neither is used as the Linux compatible string.
> Sashiko raises a reasonable question about what you'd do if it turned
> out your current OSF GREEN doesn't quite comply with the specification
> or needs some additional quirks.  Does it make sense to have a more
> specific compatible with a fallback to the generic one?
>
> Or given this is mostly about device firmware maybe this is fine.
>
> Either way - would be good to add a note on why that doesn't make
> sense in this patch description.
>
> Thanks,
>
> Jonathan
