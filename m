Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A88528641E
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 01:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778291641; cv=pass; b=o1HGafHZ2HzEM9Rt5DY9QZYXFhqZvt1PnOYOk1/o3ERAx1x7EYuiWpxIglLLDO4A3dbKy97sc0TTwIWWmwIkL4iKAphSGEyGYB2zhyZN7eBP7o+sc6uLG3sTJqwRzwK8H4CubTXlHBuSyUINBG21Pg1Ddrz5jq4R58k/Qp3qFzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778291641; c=relaxed/simple;
	bh=1PWTKn7AYLgvu7KMlD/EOdk2ffKe20IVZ6QglBuuceg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gC2ce33G246zpYlWemTJfrQ+6YAe0fMqqCxJj9lbKYdXYmCzQ1bpI5qO+mzA/FJ+1KaPFuFfRbaAMt+l7N8xntp3frhTH1ewACIrSOAWUhF0xgpcuXsWtjs4l22wHDOpmnCIund0GdtF8ON249l4Eg6GNk0/YJdjgVfc1dKYIhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBbxPHZA; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBbxPHZA"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso3128778a12.2
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 18:53:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778291638; cv=none;
        d=google.com; s=arc-20240605;
        b=EOErTwt9WuG6j//uZdoEepnqKCndaXOamn4uIjmVRw0OrQ253kZpgCVmDkzE0A6JOh
         /c+ZkbLentnacy0hgzaRrVq75YTTh29J3aytHJqF3xw/q52S3hexQn/lZdCITBCdaodk
         ZX+jezWOkSwe9kNKXJHJ33vNEhB70S/0m0br6UCugy/j/U5GO1+3zPl6w3GKSOFDKxzz
         LwN14wxJWAiFZ+Gc1ue2UQzSrfa1rE3/ZcdHDzO9B6NTFCB1uKurZLlJ9Rw+VLRH4jJK
         hXNZO4NZL+9nJPiTndkrQ/aOg62eyJ5bNks8vn5QoymJa/a7QTI+MovgOPZR5q5UIqx7
         DjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1PWTKn7AYLgvu7KMlD/EOdk2ffKe20IVZ6QglBuuceg=;
        fh=0Z3Me9Ny9YpbpZhV7MJi5UR0lm2ozKw8CMaoBPmLU6M=;
        b=NYYyJ1e0fWrqPJHSAmBXvWFYOxCr1kffWXVxXpvcZyZmZHygf222pUpBUfFN/cw7MC
         NwEv4+fbYg5Pz8aX8GmbXN+tTw+oK8+PFN1ZRXqE/E1XEG8Ui3X+TMSBs32/IiI95/uP
         o62IjPDwZTws8pz8ABEPGo0PSBEdPexa7baA7IKVKtSPwvmPW9U0hT6Jqzs6wdQxiQv8
         qZ7UPO9UafZJLclgZ2Mp5n5kuLjdZbyqiMj45dB52hVLog/LzwEGBajj0S41wEwqgs6j
         3xkdMKkz7r56p+vgfs4iL/0AScJCyrv58ovNpOZeB0A/mFq4iYdjQIcvdCQ0w3PX/RXQ
         BqLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778291638; x=1778896438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PWTKn7AYLgvu7KMlD/EOdk2ffKe20IVZ6QglBuuceg=;
        b=oBbxPHZAUv7GbHoC8LfNfUKARojEG0bdBoI649iItmGXXh9mmbkuAjhPqvKrk+A1Ca
         4ueD7tzkuspkQuiQNLxSUbaa5H0Uvk8lWtjImJ3wBUisqVmdzudlDqO8bXznX0OLKaKN
         x2s0QorCWYP8iy6DvLYbatHASFYBqgCbWk8Bu8ry28E6DrAPHYGjGwJJmSkKArFZNP7t
         zavF3jkqBvX5v1Fb/f02Z6Q4XwVmg6ku9+Y0XDuR8rbDfbweVeYG8cow3ZXlF8dfs+XB
         GsxU1w6Z7WtYmCnZG2yAK0Eumr+0hUCqVrBMO8a/oMzqqzMqVlIJ3UkpJWUwJfez9pqb
         I1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778291638; x=1778896438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1PWTKn7AYLgvu7KMlD/EOdk2ffKe20IVZ6QglBuuceg=;
        b=qREdet0t8pdy1ObsE9MR9Z8y2Z3oaq4HLH4Gl7bs3YuEVT5XnuAnYcVhJ5SQZztkkr
         7NoLbi4uCzL+oo2c/55LgNQNxL3PEXdMK/GBSNLCd+5uXZ8Y29Ai9JZUNJaaHgis46Yg
         zs6K+bfTXy2VFYn+jNNUd4cPXmlHf12o5Bmd1wWceXq8kg4O0lWDQ8D6opFL1nueoPq/
         NdmCFYdV2O3dqgvkPpD9QwX0wULzJ2Mx8gDS4kIiZRtPVdA5NRK2HsKqoMNWLPLlBtO/
         AuLL8jhhEk1QWOhomMs0ZzSmlyloiUlHbfZdxW6RMFsrC+Y66mG2zjExOz93/W6NDZ3s
         q4OA==
X-Forwarded-Encrypted: i=1; AFNElJ8vir59A+feE1260DlAdsGiwYKTmzQjGH8pLPfLzP2v0/KJLsLbCd/Jen2JucjmZoUtdJFYuRmjKbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF4Nqlce5JIj3SRmG6vcHHAD5uENNRn2EjIswFbDSXUxc/FZKE
	9rCOm5BTzOX3oyFN1s3NhkIi+UmA1iWTVj5hOME3/muMCM3OBK44vtUul+2MYb9+kgGjmgULyiv
	1yOgbx14vqA791tfsH11sK7LTVp1MO7E=
X-Gm-Gg: Acq92OF1g2TF+/wMzCYFPhCQu33k0McPS/3pASR/zvynB8LrIe3Nw03ggLPvKxoYxiY
	NvvEa+VFFnMwk7jRAUV0vt6cFzSCRX/b61xRIUmkjqJUsffOUcBnYu4dWQGXIpQgk8xLQbUTDRN
	c3XA7wxVjqHQWjijd+1SYinPoOARZRDmUjy5BsaIahSo+xnsBWrkPrK1y/OOM8rQ+lvQZvpJInL
	1KVYMce97z2QwZyXVv4BKXf4pEWS+RlmCpIWSTpkEDqUlPHkY/oJE7PzN98PHrkhfJqgiO8cLgt
	UmyBBZSWjVdW/FFS6q8E6vKETkPpvO5CHzS29ZL90OSES4eu54Sy
X-Received: by 2002:a05:6402:e88:b0:672:be92:e913 with SMTP id
 4fb4d7f45d1cf-67d645ba7ffmr7195826a12.17.1778291638384; Fri, 08 May 2026
 18:53:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com>
 <20260504163915.4a8b028e@kernel.org> <CAGCJULP83NnaX6HAqwb3umDXsxN8LH48_gPpJ_3gG8_xA96QNQ@mail.gmail.com>
 <20260504182833.344d7b33@kernel.org> <20260508033210.5149db4fc3977d33937e6942@uniroma2.it>
In-Reply-To: <20260508033210.5149db4fc3977d33937e6942@uniroma2.it>
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Sat, 9 May 2026 10:53:47 +0900
X-Gm-Features: AVHnY4K_nqWe5NsW0wxsdZ1F8p2ge0h6vNtdlnAMLhajGOPTKK7c810iiAxGn0w
Message-ID: <CAGCJULP_dTSjXQqyOYXckkmtd-HAPo4UT2V0WQofOZaJYLgENw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433) behaviors
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
	stefano.salsano@uniroma2.it
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 10:32=E2=80=AFAM Andrea Mayer <andrea.mayer@uniroma2=
.it> wrote:
> just a heads-up: I am going through the series (kernel and iproute2)
> and will send detailed comments within the next few days. It is a
> substantial addition so I want to take the time to review it properly.

Hi Andrea,

Thank you for the heads-up and for dedicating your time to review this
substantial series.
I will stand by for your detailed comments and prepare to address them.

Thanks,
Yuya
