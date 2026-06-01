Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB1C3264EF
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 16:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332456; cv=pass; b=MR0UIQdJLsROAWP7rqb6er8KmkLynOUTPOyREvhTVm1wgr3CuhCBzkqdnB7qq3w5MpWL6xSrl1W9vvG5H4GI8w54TITDQlj7a/9YIqaOF0sD9NPXPXI4FfD4k1qpcsbfnHWOWtWTkNsuHsPuZSIkVHTfZ6hCDlWDZ4Fp9DR10wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332456; c=relaxed/simple;
	bh=xo6AraTzJMTpgSfCYcj4/S3X8D0rbyuKdNz81jBZtVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FaGjnG9GoOIMrhuowkj6nmt25YhPOwaGYxpXpDWmVy4s1Ag7Kq/r1DA+rXM8iORaaWKSxe/dzy5decrKl3drAE9FFGt/R7rm4CVItt/970P3jK6LKt5KPcj0lg+AYXEnvjZ3pCDsJOvXjfNc35M4mU6G1o4MoKTCxg4LVufm4iU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jypdayeo; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jypdayeo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490a765d410so18283605e9.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 09:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780332454; cv=none;
        d=google.com; s=arc-20240605;
        b=lwpi0/LNglYXg8j9TP3A1dj5nhSgQ5BsjrX+emoM7+O3fKdHThLoMfSTDMc0mt1XTB
         EyHKITz4DgOXNMF0WFDOt5t8C22ALzbBo76W74Q6AA4/VL/J27WSzgJxKf3jn818GtgI
         ehqnBfNrh3Dox8fkVNW7lsY+q00xWMHSbzyZVHOLujYE0KT1m3/nr8WXRsPwY/7ZwbyM
         lK2FJuW0QdKCKCIxE5WmC/MHEBMKwGkXEGLHuCmGPOwwfKXcHNHJvmBHMo2JD7eHLZnY
         Am+QV8R5MqV+UjikX9vQf7q8RWUuftTiPSgs/QPcA8cU+gfi7H6i3Rs4T/No8HGstS0a
         qWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xo6AraTzJMTpgSfCYcj4/S3X8D0rbyuKdNz81jBZtVk=;
        fh=JPVK+OJti+ih2m10pOFxHg8ExG4faeA9lZVKaO4+2JI=;
        b=UNSIV9MjopsgxU4fFv+Zjmd26BfsscciO2w9nZSCx18dbJbCwfI7MIt4f5/j4/gfC0
         JrLqCwab8CzAARUY2r3iwXNQfYptZWV/J3grD4eSld+V8p7NL26hdZXzppijYej1ssAK
         quoS9fPrflRJ4XMp0XOaOjd3A2ouGljviLVoMf27beXwmLG8ixquaZ4aymG49877juad
         y0LNCQUsbf3zTbV/Zh1jwJCgsRVtoHUxQtSGjcpKIV+Cf5/YFXTOV4HlMb1oHA4CY+Qy
         EwlzqaQ1o3H1TFhdZJGVAeUtjXnAc5oSLIy0R7EIc0AdAt006uZIQv6Pycg6jQKxW8jf
         rb9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780332454; x=1780937254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xo6AraTzJMTpgSfCYcj4/S3X8D0rbyuKdNz81jBZtVk=;
        b=JypdayeoiJWuYFe2nD69Ux6T7SQW2QYHP2p9TNsPlsr9yXMJBiA5+2TUcQy1NsSmc7
         KhANsa97HrfUKSybVgZUZY7IXf/fM0ohkoC9105+f5V3TZAXd/WczuBJMNTlBBP8FtsV
         ogBnhdmekAID+/0klZ057opDcbp9fl+jp5+razntat18FA//6aXQPJWb0bM0jSNGid3+
         cSqVegu6qVzYoqNjrr/kl89UH6adpr3jV7jCpebYWxel0IoZqAYEnWn8IdmXitgBBDzC
         Xk0cYY4WPpjs1jFZ4J6Qdiy5B6CrO2IXbBeWyJ2lHcqRYjzQR1x0qV4Un0DEPMDOakbd
         d7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780332454; x=1780937254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xo6AraTzJMTpgSfCYcj4/S3X8D0rbyuKdNz81jBZtVk=;
        b=IfKThuww4ynaCBodqPJOzLUMqg153L14pA6vBPTJluv5EpLn7KZMxFp5a/rpi4vPKh
         dr2bDBsViFzRI9alGN4Rsp3zcoa9zv9tSIXNaFAchPltEW4mrUM1VQLZZD8KNibCMcI/
         fjCpkpkmkFsklY/f4Kg2IhPkzUOdQ01s08G/M3lX9nlPc78MuKadY6nnYLf3/7ZrfxFG
         zE+NtkDtldLZpJ1/dg5cu+V0Yp8dZSPDyDLYOeqrQE650wEFmIdsFKQjdfXhXJNMlXYB
         NxiFdLuN1gV5fBT8fUO6wOl4QmfXbXrCIWePBvbO5an5doq0eIwj/Uw3OpdAH1G6qsWc
         HXfA==
X-Forwarded-Encrypted: i=1; AFNElJ9YtQWwrvOq03Gp7B6oVUpqeR3Luw2SqwjBe54otv/I4L01i0m8W6zPlgES/L0qewgQ+89Pfdu85Qk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh7c/c82SqEaopGYCGgTYegs+wVdey+fFkKOHq5dojdudB/79M
	zRbcCBjivNrE6M1fPCdH+pR3pdaB41MFZ9h9ZAFaRk53b4COk/lrVtljyNkX8JznwdP52hLPWUW
	tg9KcvHOLsghYOlaUdGY6QwRgkNG2ycc=
X-Gm-Gg: Acq92OFb2Ar9ffWGSdoTVQ6ZxnutLqbi4uGVvN3Cb9Vv4IvCpYWIQHISLPph6IxpNjr
	+j3g8kTWmJ81C7Au4Re/dkqvwRUqKPJJfONKlagMYE+wEjEcy62ygKsgGsM/s3ani7vynvMMnnx
	YTtJ0H3dFXSj7de/bgqbsUOeR69RLWFlysfrAifwZRh5UYoC5rD9ZaM64rsva2GgZp4pRZchFMO
	mgrIwoONwBv2PFtZNJMF9BQolifeRTZuNxC59YbylZXZ5espSmkEy+8ikv01l0vOa/8qXmbGOUd
	K/Bm1EfFKMKYgphZQ17UBVD7AHKQk73fMmHyS2ZMqy2A6KZn8NYRlkOtIz10
X-Received: by 2002:a05:600c:a214:b0:490:958c:46dc with SMTP id
 5b1f17b1804b1-490a2953d0fmr139013995e9.17.1780332453810; Mon, 01 Jun 2026
 09:47:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-2-jiahao.kernel@gmail.com> <aho7nepN5jZtKmef@google.com>
 <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com> <CAKEwX=M5KiWc8ZZTEXCXtxeBrQho3Gs-JnKmBB=YNUkp=WXaKA@mail.gmail.com>
In-Reply-To: <CAKEwX=M5KiWc8ZZTEXCXtxeBrQho3Gs-JnKmBB=YNUkp=WXaKA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 1 Jun 2026 09:47:21 -0700
X-Gm-Features: AVHnY4LNMMUatp6JDueU4CjsI_pQhdw4wgollhGHxH_yjG13hM-7SQCVtIuqd0g
Message-ID: <CAKEwX=P0aRy6cep1GoEVxRejm03YQNis2VNgY4+F66BzDPPOdQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mm/zswap: Make shrink_worker writeback cursor per-memcg
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 9:44=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote:
>
>
> TBH, I think the spinlock is simpler at this point if we need to do
> all of this explanation to justify correctness of cmpxchg :)
>
> That said, if memcg folks feel like an extra spinlock per cgroup is a
> bit much, we can go with the cmpxchg() approach. Please include a FAT
> comment explains the compxchg() approach's nuance in the code though.
> Speaking from experience, I will forget why it is correct 2 months
> after the patch lands :)

Another alternative is - can we repurpose any lock here? Locks seem to
be per-lruvec or per-node, unfortunately, and we need something
per-cgroup hmmmm.
