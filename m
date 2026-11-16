Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794855972;
	b=JsJX9vqknAw2avMWjCKKG1bp/WjNJEdxwSj96oL93NySr4v/eVGON8OFaikog0UCzBNs
	 KhjP9Pz0dv/XmNYMCk+LgidOreWgZiBtKFZ+M0PU1EyMUE40TcLQunG7/mvkfKAn7W1oH
	 nLRTSzoDO1pQuJjNTtGmOH+zwfHO4z8pea/kRb0UAGMofzY+wu6Cm6YliIb3pgjr6HsrD
	 i75loHTkTIdmiBxk89CZtMHKDkCLC0//JssqgXr6oX6Stq4yIdXZGJ1HlXC5prZi0F6Qi
	 Yxh/Tv01q4QUHanM33H0e2QIdd8bF9d11m/qYUa/XXKrtn8na60zoyagzUjeiW3FlvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G7I1SlfQuGFwSPm/Qi4+nTEZRsPgA0OBSH2M8WIp0JA=;
	b=e1ozaSBGjTUAL9HrMcs/vZJQegrJV2sBqVi11HuTmyJ9PcGlR5R0zvJy4gjcwQR+x5/3
	 AVxu2gy7l9pxUflICiHlkOJuAiNFMVPnOxMiGmyN8sU8+g/WiAtQywufvlx1uPr7ZgdJ1
	 qOtL+aeVLEND95ccQFCYnkzyRs5Zf/uXObMNhySkFbQ4+0rPacrkhBFKbZ8FXsf9oBhgD
	 hagvXTAMiIew9hKpQ/D1ZCpB1vcRDVG4vXnAwkbZRTfqA6lvSe+VWMU6chU2+vovmZkZv
	 0syoq6gfdeadUgziLSHQ7eegWjkEC4V8MjN7prRlGtb6mh68DBWltTLzDKZ5ut6DCgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=Jm2Gk8kj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C84E606BA2F
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 19:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C84E606BA2F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=Jm2Gk8kj
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5ee27c9eec0so1006356e0c.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 11:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794855970; cv=none;
        d=google.com; s=arc-20260327;
        b=hfx6bTDQx/ylonUeAOTOSUmSz+baqV1AeFtgKQeEHcpdoOZyuZLFGNaTO/Wu5qmkMW
         h8OfjDmKm2LhSA6ICLpR17XObPz+/stEeD+d82mL7Id9laf65qz4iSOho8UqznkAJi3f
         DP3gXqSFPZi/JFF07rAFgbHv/3iNX2GY7z1Gbe1LQ/SK+mtH2qo5OqF1whlgH3hP/Fg4
         n+MwCGMB7ofxXJHS0Hw9d0m66DnBHtYapO5EB0b7yrLdsQSN3Y2d1g8JvwroLTc7ZmEs
         Vj5Xfc14P2o1+JTjW3wVzL1FLVLRyLxu+/PnHf9TfSfgIkbrOxOq0pyEbkRZ1Z1svbg9
         tH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G7I1SlfQuGFwSPm/Qi4+nTEZRsPgA0OBSH2M8WIp0JA=;
        fh=hqgA+3c+0WUuoKxNX2gSz8Zw3F7tPomxribfK3XE8co=;
        b=L/NOEqdlq6lfa54DBk+M3xCDkVYnGl1PBX3NjX+RIslW+nBX2IIn1H43FWP67ap4Xa
         Ye9Py8/eSYRP9LhLGQvaQ/O7zbhJrSQ85i1r/pbSX9R4MlWGtDV+4fJNvAsFiwfwjoTG
         19VKbov9DKUv+6SMEH5Fla6HoZtVr5P0Ujfuavct6/1rZsB+neAzHtK8eDcZLNmyto3H
         B0IOos7InvDWRIA4b7i3mUDf7wDMe4LZkjz0sxOuzHCbaUoTuk8Jl1VqxcnN2E1X8j6y
         mXwn0e2Y4+wKWT3ITWCKmB0iog5c6mlD9zmlldoO+lX9Sj7+G06/8nHGRIRdgBUs5ckC
         PvtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794855970; x=1795460770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G7I1SlfQuGFwSPm/Qi4+nTEZRsPgA0OBSH2M8WIp0JA=;
        b=Jm2Gk8kjWWwRV2Oi1KDcMVKvvo2dKssVrRlht1w65ARIvAvJHtaRkh5gALMeNGFexR
         j2tS4wtXZv6yXg83D423lAlXUdUogfBCNoql26Ht2pY9lBro3u2idDSeOaZkduUKxiwt
         g8cTxqxbDTTTOvMQZYgK5qFPiJ0jZJY9+JwRFURRFaoYKECLPDoGE9lTtLEC5ClMw6zQ
         W41sm8KufFyLvIFlC7ApPY7fL4TIZGIgN6ckkuKJV1IWh9KX4VRJ9wg60OI2QVITa/7B
         h6XBilkVxUviYZ0x1faQAS+D45VQIabR3Pm3OxpAR6OX1tFpiMiSDb/O757nTsQGAq9T
         DLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855970; x=1795460770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G7I1SlfQuGFwSPm/Qi4+nTEZRsPgA0OBSH2M8WIp0JA=;
        b=Gzzz12GUWz+oRtv5lwrEmwqP2u/NyWNCEPwZlZl6/4vx7e0wdQ3Ehu0rmkWEMBtVeo
         +2lN5IANtSKdKUhaVLgubxIIYE0SpMBrZP0DHBYA6nN+2io8Gu1yKAzr9D458v226jhK
         tKMzlZQhP7DsVvF2J3pdj1oWHmC/mKAwEdIxDiwjN0GDX0KHZTXt2M0R0T3jwIizhLfV
         tgMC79ZiJWiYk1vtMC/IPvHQFSu47c0nRF1pV2W+BZayg+bye0yBihPlJl0x8wRpA4mb
         FwveC6EHwn3vaar0fsOixqrtb/S9CH1m2NqrqS7YwlnLf6TP9IiOm7brQG2XPko8Siv9
         pXuQ==
X-Forwarded-Encrypted: i=1; AL+hErFQvtas7K5bmg+wpHcpyJn17tU+qH4rRIDvNFuKWu7EK8PMsQALNETy+PFRUionuw1tPHg2COcUUyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tQLbfS9W+dvNnkA0OM5H0LmTA36QEG1tNL+m0gPHY4qDbGCYf
	fbKqctLzMUOEVLpsCsXdZVP4103QUV5eBrSP4Szq8H9mDMpM55SFkgRdHaPo8vIUoCeNvuYJXYp
	ZwkW90mZS0wOE7G63nrsBSbD7vVpNIPQ0xr9nTb1LZg==
X-Gm-Gg: AYBFou1Iua/jXB6/mWuqL3PxSZJ6JTDNTNgc+wXSX0LleZXC8rei8zounEUp+A28Ntb
	y+GZcn7cRoV1H/A7r8tOfx4XUiyIDEi6fxz2O+D9HmyNSQYxUUZ+U7i6kuYGe3CucYvgIJJD6RM
	CqRo+Mf21jvhIamH/gP+5j1jwFiOVQBaeJdnUlKk/pqTEjmvCkSuWzPSwZL499Hk8eSluPzHHOz
	fs5S3/MB6bOH6SvFjmY6pyY1l7AUb7Ty2RMaihYb2NwEfXbOWMt/NI5I4P+9vL4yBVZuIrg0Nu6
	B/Ato1XvxpiJWEchntZp3LqAPQfM9CsF+G8lwKNghvQBNS5g0sdKhan0O2wSJiYsELme6UHLw3a
	/3HmTFS5A1ONMTAASkmk+TR6H9Yfpn2qLt9pFQQKvvUqmtMDgn3Sio8xBK7Y1lY5ycPh17Bl0GH
	ph1F1s6U3rEjASVtqC2zWYP/m4ANsR5sFEimTKfcd83TsgGxXGcNsfRT/IxgMUCaJDjLRdsKPW8
	XrTsh2HtzOSK0LUHDllUm6HhB1a9utwd89jkqtOahk/G3s=
X-Received: by 2002:a05:6122:1b10:b0:5ec:4a13:8aae with SMTP id
 71dfb90a1353d-5ee34a9298dmr3969191e0c.17.1794855970467; Mon, 16 Nov 2026
 11:06:10 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116190111.3317976-1-rjethwani@purestorage.com> <179485574283.3291.7349043137994808253@kernel.org>
In-Reply-To: <179485574283.3291.7349043137994808253@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Mon, 16 Nov 2026 11:05:59 -0800
X-Gm-Features: Aa3M54o7vX-XpVUCQ5-uuaPc-Fmkae2NyST6GEXFL4X2HiaIMluNfTh_m5Er0I0
Message-ID: <CAKaoeS29P8SukOACusGaO=7z13_eFR5pFWDjbYqurgYd2bVz9w@mail.gmail.com>
Subject: Re: [PATCH net v8] kcm: reject TLS on attached TCP sockets
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, jiayuan.chen@linux.dev, stable@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Dave Watson <davejwatson@fb.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:02=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Found by code review. The sleep in atomic context was reproduced on an
unmodified kernel with CONFIG_DEBUG_ATOMIC_SLEEP.
