Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7956B263F3C
	for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689499; cv=none; b=Ds5HzgFnekcJPCRunZcFOGORuZTZzHQ5jKRrFoPB3+DVFJNd1TWPYq+hhzm+ZpE/5BtdOFr/dys0z56d578rouuaiM8Y+/yXj+lS2pVEY94qt/w3/g8nE4gd0UlFumTaQFaVAICKj+Pa7Y9u8R81kGnZ8h6HgXF7PRYk3bGV884=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689499; c=relaxed/simple;
	bh=27G5tZxM8xD6Y1gt414e7Js81jz9vu52ASWX9h/SSQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSaUxs1fpBgplpTWFEwNgIcfM09/1F7Q27CMAorkulpnfzfLX1JLjS6/n7+ImHH4K+Zmd+60JbR0H6pC43exAQCvH0t6J94wv1GzxHgqhbywomQzhvgek/DdFSO922sZtgNWo45OpqsZwnYP/5Acq5Ve+DxTrRPBDeFDwlJ8nr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZRkgYwLi; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZRkgYwLi"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a77ea7ed49so29794771cf.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750689497; x=1751294297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27G5tZxM8xD6Y1gt414e7Js81jz9vu52ASWX9h/SSQM=;
        b=ZRkgYwLi0axVXJ1XtuDVu/pZKhwxu1XL8iqireNWT9m7D33s8XHYSYdrVyfsEGXiYg
         co3kWkwPzyMABwFrnGsTOhKGEsHxQSQu55oSRKU3koTROserxCcbyGynOQG+MmZVl1MN
         RVCYyKdS8TGPb++b6cdoglTmryljqA5kHCATNbWsTstFXZDKi1nqLcBxrEHL/c44wAgk
         XjGVYddN43o/dJgX44PPX1twuv7ofs1TDe/WoNJkAnNURRPpONastlq3gE425Y2sbJhm
         SYGTUKfc8241PcusduMiTMOaG2X77QdjDR2lhOTeC2qNyoP0AsCmvvisT0ZAq+LSEcNE
         B6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750689497; x=1751294297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27G5tZxM8xD6Y1gt414e7Js81jz9vu52ASWX9h/SSQM=;
        b=NCHLEqivNNbLSBQxaCg0Y4Yd6NRtzcnuHn6bQW2KWDIX4HLCF3G3vzrP1i1KAWOWXK
         XdAV0CNq/0SIJ7U0W/4D9T5Rah3fOwpi55lm96+r4pgDqm0aZcQGNU5dWMstOoPQjclS
         u1Fe7fRMioSuJno+nZoeJ5FBncqzx5MWwWx+4jOrDBJb8D7QY4CFVRDPqb8CkJLlhWc3
         BhJnICj738maGPJYXSVXz9AJbOAG3cRbMjrcDiL60ye1xoJnce1TZjSHtwn0lL1jJobk
         cxoa0L4xr1eNZcx2jO6pwOW5UZD/Ie+P+XUm0bjJ5ZKuB80sZDSll23KBr3tdHWyolww
         /IKA==
X-Forwarded-Encrypted: i=1; AJvYcCWb6lRXEC4RCmEJZPTQdJfIRaINddotzi6aLal9QCW0kWlkpvtuRM7Kqwn1w6JE70cs04vJgvstdPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOYyOkAJtXPSxrsxcM4eQuZRxw/dS52kYC36GSY61r6bKx1DT5
	nPfmL4lhCVFVZ8BV5o0veXz175x8Q6iYqT/VQ9gX+UgFcozVYamK+GWsPydRQKdWdYAkNWofK+6
	rkZ/Vlsn2/7A+qa14h5Ukz2EE/J7RfNCE0sG8Oo1P
X-Gm-Gg: ASbGncupWakqH8yMavo6itTc60AczaQ5INoIulWDoap0LJFbIybm0nKRMYLLZ2EHaYX
	J9hS6GYIS7f/1tz3JhDmvX20dTwslGcWU4+fNX3Z+RFsZfDGGudP1cy/m5YDPMRFbnRBr/jh8UG
	d604X6tdsm7rjRuSRm4Q6apjEP7Xivq0tTL1qClZgr5tU=
X-Google-Smtp-Source: AGHT+IErEx0kDAOqp1ojFcDM9yYCZh+mVleoBFl1AEdwsO+17A/oIA84nB9tL4FUjJhJfRwxa3+3/8JyJJH7G1AK0u0=
X-Received: by 2002:a05:622a:750a:b0:4a7:7c8e:1d5 with SMTP id
 d75a77b69052e-4a77c8e083amr154660831cf.17.1750689450031; Mon, 23 Jun 2025
 07:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621193737.16593-1-chia-yu.chang@nokia-bell-labs.com> <20250621193737.16593-4-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250621193737.16593-4-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 23 Jun 2025 07:37:19 -0700
X-Gm-Features: AX0GCFuRrhX0LBiCnxAPHQ5MTAVLkaa48kUt8r7GSQvKFHWuAgGT6_YRkQKc9Ek
Message-ID: <CANn89iKXWH8VLY5W+iM4d7MGYL2dMRep2xG-AGGV7BcbJyMY4g@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 03/15] tcp: reorganize tcp_sock_write_txrx
 group for variables later
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, linux-doc@vger.kernel.org, corbet@lwn.net, 
	horms@kernel.org, dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch, 
	donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org, 
	ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 12:37=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com=
> wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Use the first 3-byte hole at the beginning of the tcp_sock_write_txrx
> group for 'noneagle'/'rate_app_limited' to fill in the existing hole
> in later patches. Therefore, the group size of tcp_sock_write_txrx is
> reduced from 92 + 4 to 91 + 4. In addition, the group size of
> tcp_sock_write_rx is changed to 96 to fit in the pahole outcome.
> Below are the trimmed pahole outcomes before and after this patch:

Reviewed-by: Eric Dumazet <edumazet@google.com>
