Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B220E377AB2
	for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517107; cv=pass; b=usXCpTlePfthQUmr+ZZnxG+6ZVGogOVCJocobDtQcAOc9XJznyHs1T5hmOOTnRwqzWAbtpSs7ZurR/anm+/b/PqQKFwX+Sih0OpuU8KSGl8oUTNRzvkadF8vv89VFCvBMVaOVelk0/QwRinbKlFocs+/OS/Pkr/EV4zQetsOkyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517107; c=relaxed/simple;
	bh=7ecM1UWhebC/3/+iusmGdcjinHnlJFmUl69Lno0FSOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqIE/2wQifxt1zHkbrarJPC+N7bfWhyhCKFsESutMz4uZH1QT8h4Blevecvx2+s9oHtUyH/i7bUwxK1fhlurVf/ZE8MyPTOFJeT84l01NwekKHCFeVlMMYhYwatAJjpSdl0LVQi/FftNCX4ShInkBeEb/xtoYWqu5X5XRiJ4S1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvuDQPHC; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvuDQPHC"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66c7127a73dso1101771d50.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 03:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788517102; cv=none;
        d=google.com; s=arc-20260327;
        b=cFcS948iwsczTLt496QwBw6uvawXxNSDjPPpLld1/Q16558VWskmkTVDKEfrE6He0t
         m6yBmmdUlK2a1lzHzvcVuJnpZ9gvLyVmQRnaq80nLTtC9H7oRs58TDnlN7/oSVeFS/qR
         kUfL9jVj4M8bQHh3cZzHyCknfV4mdyOLNsF+Y2e64KOVIkZ/UEwVLM+Ylkp13s6sOFD9
         CBe+7PJT09cIpTD9RM6P43l/0wvDnFX0kyhb15CUYpX0VQGnNXWkyzcOh8QCwPM0ZHXZ
         6E9RQDTm2xxbXJnDzzJ5e5m6zEJ3n5V4FMeksO/ibqjCom9Lh/n2MJp7oQ9mhsEKi+KN
         P5uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7ecM1UWhebC/3/+iusmGdcjinHnlJFmUl69Lno0FSOQ=;
        fh=XrC15h+Yv++glmKHn0HdDMc08je2vQl5PfnzpQoJqis=;
        b=mAnfWv3bioBr0t4SEM/LyNQCq95muy7nBozuyexfXAI4j815qkKRqKl+p9DM6knsiA
         FoPeM5AlKB2SuxCJNeR65D18HHGKRvj3tFI8YBudHQ4Gd/Ag3zFkcw2WX8jUQqFZVxcL
         +q38z9MLZzqzMyI9nEwyaCNtjHMbXEhoCSne89KBadJJr1qvU5Tn7JFK+NgH7ZtuCT2Q
         TNaRdvnb/LYpGMLe38Ow41YtM1MkGgUpjGpvkGnW9qsuJTY59zqYIGdtgeU6ZYfBLuq4
         IA+aDwIZVxqKMhYKNa0+H2Y3/k8rbOlL77aMnBphXNsHPyASPKU4tqQE39XTVyJ4VPN1
         ntVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788517102; x=1789121902; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ecM1UWhebC/3/+iusmGdcjinHnlJFmUl69Lno0FSOQ=;
        b=kvuDQPHChtGy+Kras+DtQIaJcoSrp84OfcYDEQHyfthx/6KkS8IPv6XcB4s0K2m1oa
         2KU4yDtXhgoHzdbgJpb7Lhkm4wd5nzbANlF1SvRHRzSg5MTOoZ3mEIZEMNvu9erpmofB
         VoUOtzy5Y+8b9w/iKXQvIaDvni9qXiKWNBtG6ybsHC9leQj/M0BN04NaIPVxc024gcu3
         48ujquQAK5YpBGCXBzeg43NkgB+Jg9oEPWbcuuOABM2En42qHFcQbVTPL5KkaykdYDzH
         6WzExmw/8trIvYdXGpeQmxaD+++QdqrAkQPxjGkPdKu2i5nWBrweHQMSoFTv3jRaTJRn
         ZDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788517102; x=1789121902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7ecM1UWhebC/3/+iusmGdcjinHnlJFmUl69Lno0FSOQ=;
        b=PlzpIVvhAkhtHKZQoLMTpJtqs5bSiF4AGiKvnTsAqIucGjhHdMNv+mOv7dDTN77K0E
         FqdIzOvpTUZYZvlLJn65ib9o47RMZuie85VGR6o6G5Zp53CGh0N72wq05uzXQztY1lHx
         9ZApL41aTnInTR033uK4yvoFGQKvgaCV2qFuhocyouBybZKS06gTdAcmZFV7ndpodCjR
         FLrz/VYYhi07MCeY+Gr/mvdfKdAcb1vMDWmSn+2X6gN63US6+aTm7uyGufaPloLxaEHx
         o+QoOgK+oAZOIDM3Yr/GFYJ5UnImMr/guMp5wKhAf9c2fjxWDF1iOrNi1sS0v4AReSWB
         vXjw==
X-Forwarded-Encrypted: i=1; AKwUvByl0MFvnlLQT8jN7vo1KzaAZ6LF7lFwdJ/VyLFyUQVnUO1BBK2/FPBe+ZZRda9KhW96bGWDEDIcvSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lRQNHz5Nykprvt2z7NNWK3WwpaDr20kHzPQYH2ZmfosM9uwuPX
	TuuBswJNclWJMDrnrjUBCk3DQr7TdUm/5x+XR6p5T+e3hDPNxfgqxKjKOgzKg4AcwjAy8OfIqp9
	zRsG92iFKE77iddRXcWR0D8y1vZEGna8=
X-Gm-Gg: AYBFou2kds+Gc8KGB9Nv8iJmwi8QTt/8gj7/anGQb7RI6hvhRIA1DOnSZQ8wg/NuP1h
	78CLGAyLAa+ZcB4pDR8akGR22eyZmdmFAiBiGOdnufjcOWlppxHpwXDmSuwT7O0FB+ptADy3f+v
	QlerISeTs8ryXFX40mlN9nfQSqFKuRftdtbwKwU4uY1xuLkdSkw+Tcrat69ZBhgzsD2Tos5hrUK
	CuvzZ18Phqrz9L8QFaAFD9bU6YenvdGbyuHMLP4vtRWHxveVbNxC7SWH1W1pp04emQeFSYzj2M7
	CGe1zfPrhyJBGCixONraCUZOSWbYvuk3ZqIqSqFoNKzFRCyhU07qlrl3snyVrqSyyiA4NjMeQX1
	o
X-Received: by 2002:a53:c053:0:20b0:66f:a1b4:741c with SMTP id
 956f58d0204a3-66fb5958686mr1624093d50.12.1788517102415; Fri, 04 Sep 2026
 03:18:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904082954.48738-1-enelsonmoore@gmail.com> <apqXNCL4X_i6xy2Z@gremlin>
In-Reply-To: <apqXNCL4X_i6xy2Z@gremlin>
From: Tigran Aivazian <aivazian.tigran@gmail.com>
Date: Fri, 4 Sep 2026 11:18:10 +0100
X-Gm-Features: AcwNN1X7ex5eCk4ouskYN2ChvEs-v8zBI8q8LI-VGa7gCcqGKoso7q1xSbR0jLY
Message-ID: <CAK+_RLm9HKkm8YCCanpOMxaMaAkt5eoxQBHBxC1-Xkvj=L=UsQ@mail.gmail.com>
Subject: Re: [PATCH] bfs: remove the filesystem
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jakub Kicinski <kuba@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Hisam Mehboob <hisamshar@gmail.com>, =?UTF-8?Q?Martin_Kepplinger=2DNovakovi=C4=87?= <martink@posteo.de>, 
	Christian Brauner <brauner@kernel.org>, Amir Goldstein <amir73il@gmail.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Eric Biggers <ebiggers@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, David Howells <dhowells@redhat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "Theodore Ts'o" <tytso@mit.edu>, 
	Catalin Iacob <iacobcatalin@gmail.com>, Stephen Hemminger <stephen@networkplumber.org>, 
	Andrew Lunn <andrew@lunn.ch>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Andrei Vagin <avagin@gmail.com>, 
	Wei Yang <richard.weiyang@gmail.com>, Bhavik Sachdev <b.sachdev1904@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Wang Yan <wangyan01@kylinos.cn>, 
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Malaya Kumar Rout <malayarout91@gmail.com>, 
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Luis de Bethencourt <luisbg@kernel.org>, 
	Salah Triki <salah.triki@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 11:05, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> Based on Jan's feedback at [0] that closes the loop (it is indeed a
> maintenance headache):
>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> [0]:https://lore.kernel.org/all/35dsgpk5dsh6bm4xoblrq6hdslfvtuibl5grzag37cye2hgepk@rkrtkjxdyk5g/

Ok, I won't cry about it :)

In fact, if I may, I would like to say that it is a pleasure to be in
your (pl.) company once again. Looking at the list of people included
here -- some familiar, some unfamiliar -- I remember the younger days.
I have done my tiny share of contributing to the Linux kernel as best
as I could, but as I now grow older I can no longer maintain BFS
(older does not mean inactive, just active at other things), so if it
does give maintenance headache, by all means -- remove it :)

Acked-by: Tigran Aivazian <aivazian.tigran@gmail.com>

PS. This reminds me of d'Artagnan's phrase from the Soviet version of
"The Three Musketeers" -- "my consolation is that if I am to be
killed, I will be killed by a true musketeer" :)
