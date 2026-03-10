Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014F9430BA8
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132431; cv=pass; b=uZJji0z8m0mVe2w8wGOHSQPmag1gJbRkJq9XvxSVugLlp5bunHZ2MW1YstxH5YqBab2fpmLXfkZhqOFrnrVhek2yvV9Gt8+dekDpkUqCdSnf8lb5wO58SBfk0vyjY8w+frr8+BUW7BX7KOKOtJztIHHT61mPS1EfNaVMKmmM0Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132431; c=relaxed/simple;
	bh=d4ku0rUPq2W2b4nzjW/2a3G+pwxDd6NAsRFLOoSQPRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGCE0nY6MG+OfUWAqxNbngFnF+VTqMXLlJdL8AbRX4OZ4rG4cvqHQjuXVFWKL2zDQNSDtWi81mjuizVdFjWf4Z3lgJUatk1hZWP/WetrQdt7PbMmInd4vyGPObcRUw/vHU0rTn9cDEwjNQMEgR0Y3ZGjurzn/E8MHCUjUFO65uY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xhG3HsYM; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xhG3HsYM"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-899a9f445cbso153877756d6.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 01:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773132429; cv=none;
        d=google.com; s=arc-20240605;
        b=J8FDEq3NWLkTIF9sMXXxrX2CBdUNJvyTZfvprQinsEWEEuhrRQBMsI4VFSVwV9tX6g
         /JqZxJFDya+fA4lxDxsalwrdHm2uvANTU5cX3YuCW4KMlTBkY9ZEs68BnWNMOc7vtGfw
         8rxT7rDt9Hhf11m3QkJFOOtIc5vIiFOzSb9IbU1Ueu2ezJjtF4MtUbx5YxyHSPRcofj1
         bBlhDB3PUVR8TrPU5b+hS6BXufGZI1dsdpPp9Ml0rz15uyj+pRfr4/GunxjqJfKBjtBP
         7mkPsYg2blVNzkedjeL8HD01dvEf9ljCk+aSjOwy3DrCDOMTIdrQnGfrWze2wjsPcnP0
         TRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/YKfuwEjoceIF72ASHR08YC1df1DlHUUca2FdDvmBo=;
        fh=sbRaQeAr1wuBnCRcXj6uy/8kab5bOecQ7DB/gPEXUQo=;
        b=j6g+kczHx7GO4ZpD42OACXBSpGMjYczlbSK6yyNnPSyHHn2iyoKHoN8Bp4sLllDMk6
         1NGXQs+KKTHaA8VW2kifZzitCCujkWUqG6TgxgZraEB3T3Da2lt+NtunmrQbGPsibBg5
         +lRWz5+4/oHap8jsGSsRAl2dPeWg9V4e/gr7w+qgJ+EpIWiaj+m4yi0gGmmWmna/PkCz
         /st9Tbsa8QkStJmR9C3dxY0ZA2+KklAPfDngW0My3KOBOL8ZAgSZc68X4F0hra+SYBm0
         B7DQ5Q7mqp3Z8CjgmXe6+PAHlBRRqUxc8K9Q4cGvf7BgEb6/0Jzj+rC2moa5AApqfhD6
         +OCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773132429; x=1773737229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/YKfuwEjoceIF72ASHR08YC1df1DlHUUca2FdDvmBo=;
        b=xhG3HsYMI7RPs8xQO/lrS9Jo+wVenz1cbTuAppsQF9yNtLQwfaKo6LALa6Dmau2hvq
         cy5hg+0U4K3XzQZN8IhobA/DeG7gHcD7BptrHZAxtVR+SkZdauq/l4oLFEHau+lQix5H
         A01Y/s/6xdR1GU6s+KWMMuNF13bmRBzgtoS2fTIn3LuSC4HKTk+fMxfYBRHzMMZ94ngN
         wDnD5QWU/Te+JBTDi+ph0ibrm3gLLzN7gmYbNx7hy7icxVuQXmKqF7zr70vEEpUCRAti
         sQd9g//3Jg0EGGSClCHJtJ0C09bjjv+Vguz7N2IsbfzW5FISlO8sAAQQkZStVaHcTk6P
         WpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773132429; x=1773737229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S/YKfuwEjoceIF72ASHR08YC1df1DlHUUca2FdDvmBo=;
        b=xCdNDkg2HYozRs848wzrr1SZi/fzPCNCr0y1sH5RU0zjz4MTvYilt3ubYN2fKW8tiC
         g9rrtTCULZ6kWSS6f6Pa/H4PkwzHpk1S2WS2T7m33Yf/Vy5LDgoY2lvuEEFYXU8t938u
         ejxpLjD7d6O4QpLkvcjrKcxnK1joS8TV4uZS+XuKP/QGv/AWmjgSLQ045cehHQtp8tAF
         HVWnhrgm5+sZrEn+K8GZDC7JZamFsl03mv0TrLesiOFknuAVp6x7iz5OzPFMYTCHyHmD
         Wx4vH+/yMgr+0n72VihyE9gz/nxHj3RwrNJcT9wuLujFpG/UQCQfaYIb/Mh65s7RT5ml
         aqHA==
X-Forwarded-Encrypted: i=1; AJvYcCW9Jswbac81TRCspwBrZNFNTaAfsq2g31m9Ytvyvrv1O9g8QvRNCD2WWjHHBlqMJTblQffU1Oo5zh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+FX0J5g6c4Myf6kryPInKOi6w8Daco9zWA040VwAsbBCCEKg
	lXhkNCxnRZzn8T12Ju7b22WVH7o3tQQsMVWsPzQdQTopPx6UWHGQM7UVREDkviGq6KxFYrtJTVJ
	THShsAPo3oSCko4Kh7DdN/xMK37ucUHbr6mOqKKxs
X-Gm-Gg: ATEYQzx6MUxzs6ZtOsAQoEFVYzxgVgUw3g+ajNfRRozCNtWS6x1ceHoPqNhXP3V0823
	Y5SGc8HrrGlmhpSdTSb+P8tSaqRj4kaih+zWPRIWV7kVHskltpqkZzS5W4SrEImpOMxdf3UEraf
	rRqDHmivqJpsin7ehMA1GFfgEU9RcoiAcjngrRL11Qf6fp76MSZbuHE6MOFY6NjSDaug3iuE1ov
	9TfcbhXGXEcxaK7Av7qDULKxA3ub6i6vJHnoRpSiVSx+rdqEVAxLvLyhS/e0HPqneSftscJSuK6
	ZYM51qw=
X-Received: by 2002:ad4:5fcb:0:b0:89a:13a5:77c4 with SMTP id
 6a1803df08f44-89a30a809dbmr212994566d6.29.1773132428381; Tue, 10 Mar 2026
 01:47:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com> <20260309-tcp_rfc7323_retract_wnd_rfc-v3-4-4c7f96b1ec69@gmail.com>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-4-4c7f96b1ec69@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Mar 2026 09:46:57 +0100
X-Gm-Features: AaiRm515yCYx-zywRXphow2t71Syn2XmFVDbg53R2r2K3-5MlWrmIcf8VHqN2p8
Message-ID: <CANn89iLrpBui8OGtPTV+Vkane7xHNErPB8a3AgOEawpi7CLU3g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/6] selftests/net: packetdrill: add tcp_rcv_wnd_shrink_nomem.pkt
To: gmbnomis@gmail.com
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, 
	Jon Maloy <jmaloy@redhat.com>, Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, 
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 9:03=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> This test verifies
> - the sequence number checks using the maximum advertised window
>   sequence number and
> - the logic for handling received data in tcp_data_queue()
>
> for the cases:
>
> 1. The window is reduced to zero because of memory
>
> 2. The window grows again but still does not reach the originally
>    advertised window
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>

Thanks !

> +// Ooo partial segment, in adv. window -> accept
> +   +0 < P. 1040001:1042001(2000) ack 2001 win 257
> +   +0 > .  2001:2001(0) ack 1042001 <nop,nop,sack 1040001:1041001>
> +
> +// Ooo segment, in max adv. window, beyond adv. window -> drop (SKB_DROP=
_REASON_TCP_OVERWINDOW)
> +   +0 < P. 1105001:1106001(1000) ack 2001 win 257
> +   +0 > .  2001:2001(0) ack 1042001
> +// Ooo segment, beyond max adv. window, beyond adv. window -> drop (SKB_=
DROP_REASON_TCP_INVALID_SEQUENCE)
> +   +0 < P. 2000001:2001001(1000) ack 2001 win 257
> +   +0 > .  2001:2001(0) ack 1042001
> +// Check LINUX_MIB_BEYOND_WINDOW has been incremented twice
> +   +0 `nstat -s | grep TcpExtBeyondWindow | grep -q " 4 "`
> +
> +// We are allowed to go beyond the window and buffer with one packet
> +   +0 < P. 1042001:1062001(20000) ack 2001 win 257
> +    * > .  2001:2001(0) ack 1062001
> +   +0 < P. 1062001:1082001(20000) ack 2001 win 257
> +    * > .  2001:2001(0) ack 1082001 win 0
> +
> +// But not more: In order segment, in max adv. window -> drop (SKB_DROP_=
REASON_TCP_ZEROWINDOW)
> +   +0 < P. 1082001:1083001(1000) ack 2001 win 257
> +    * > .  2001:2001(0) ack 1082001
> +// Check LINUX_MIB_TCPZEROWINDOWDROP has been incremented again
> +   +0 `nstat -s | grep TcpExtTCPZeroWindowDrop| grep -q " 3 "`
>
> --
> 2.53.0
>
>
