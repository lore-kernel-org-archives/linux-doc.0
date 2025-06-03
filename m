Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C1418FC89
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 03:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748920831; cv=none; b=frXNrFctRXGAl5D673vnUEnIkCsX1BISUaL8CaIAnEB73TSRe6JcMZA5CQdX2KVoBQJjrDICCpZPIGaLgQvT+IMTRQjzXccncKPuZ8j6Go/jUrKB1YCjwF6bb8jKUB2TUj7OnOkB7WaCfZUG4nMB9auPmnHusj+PYvNK/jmBDi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748920831; c=relaxed/simple;
	bh=SuUuFxKyZLAGBzKOOo1OIiQNWaS91RBjDVMCFq+b1Ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QX/5zqN1MV4riciOomQb/nuVdIWHsRZgydnaZZBFHUwvwiTXjQzShwKrkW7Krzq87p4cl54RhHcqaVw/8Fizew/zyCy1yQG8uhYhQ4zPHiEdpGs1StbgG8hYnEF8IqoKW1VJamQrpdt8abzqeR+m6CEQJs1AhsTPJsobCZGWhds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F8u4YpM4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F8u4YpM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748920825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SuUuFxKyZLAGBzKOOo1OIiQNWaS91RBjDVMCFq+b1Ug=;
	b=F8u4YpM4c8cviBr8P7r4QYZALbiCvCTMgsTZm8WUwcieOoTGTrVxjn2leBKDyw7yTbGLNt
	GS3PUcDwMqVhO7IzKO7s3QbedKk2gvqqSTz2uo2T0i23yJoLD/G1PJ588qmGui3rfyvciV
	CEfHYFI+x0CfCGMhY01/4F3P0dAexwc=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-7nuyJnRDOjWPopYwxY8Tjg-1; Mon, 02 Jun 2025 23:20:24 -0400
X-MC-Unique: 7nuyJnRDOjWPopYwxY8Tjg-1
X-Mimecast-MFC-AGG-ID: 7nuyJnRDOjWPopYwxY8Tjg_1748920819
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-310a0668968so4942267a91.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Jun 2025 20:20:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748920819; x=1749525619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuUuFxKyZLAGBzKOOo1OIiQNWaS91RBjDVMCFq+b1Ug=;
        b=YhNyjUlmJkazM0QToZ0T98bh+znz/Rme5DV0GZ6TsTKKxOST3h/bz9K2ROfGxYKm/A
         U5tQXt/Ck02hiFMldJa3G/582pmPakMm35WAkCU7+AEtS13mMQpCvPoh18vCrKQUHOzg
         UA8X6rYytIKrb+Iv1SD+EV8R5b9gJHW/5Z0uAI1ipSTshsjFj9OQUNsGRXfMhiGaYgaa
         qTYKVLv9vO6CTDne5YDe9pDpzeQMRfjdqfm/UGLGgidCmwWLjTU0zdqoFpzUtRzoD+nt
         HISMUkQv0z+SZRpS5yk9x97pTv7q9GyjIlxp2EZlkVNBs1s4YKwixeygR7UkxYTON0Ah
         i1+g==
X-Forwarded-Encrypted: i=1; AJvYcCWeV0GrcuUVLTpULGsvNd5+CNbroy7Vax1FPgUP2KpDVgXRJuHAw2fhyvsAaNuqLmfD+bB/eTbN3kA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuMPXAx2yeG/ngWKnEJJfUqiZHw6brbBg5BnmYq979yjV13ExZ
	TrpEJ3mfGzyQ/y/TgKUUqxXsona2SBMEO7NCPltrvudoBHxGhuF/fgtcW+uH1ZdWYb6b3mX2Ilp
	fIsRmsQGNbP3iT+CMIouMjdDa+pNwXZ/du4qYfenuUONLko5IMuY7chbEFotoBC/6M1ttymeoDn
	NmhCAUwActGccVEOzwGad9JMeo7rD6ltIw1H6b
X-Gm-Gg: ASbGncuteETwYsZzdr2tnxSvQNQJwKGIlWCXtnWfUqVUOj5dCpodj91xLCaRqryi7tT
	Q87F5F/pgV2Y+Z6RZ3wCO8GgDS6En3YCKKFC6c3jLnnN+uc1OAOlmbG85Zc7nQ2ZyyYlLHw==
X-Received: by 2002:a17:90b:2e45:b0:311:ea13:2e6a with SMTP id 98e67ed59e1d1-3124150cd29mr24182678a91.13.1748920819229;
        Mon, 02 Jun 2025 20:20:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMKoDoVhANJXhkEH8PMyc1LxUezj6sEzlWUU8w4Uyd+7t0SdHYB02l6iAUnHMY64ChUWPuoGBpUpLK5iNRSqc=
X-Received: by 2002:a17:90b:2e45:b0:311:ea13:2e6a with SMTP id
 98e67ed59e1d1-3124150cd29mr24182639a91.13.1748920818809; Mon, 02 Jun 2025
 20:20:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530-rss-v12-0-95d8b348de91@daynix.com> <20250530-rss-v12-2-95d8b348de91@daynix.com>
In-Reply-To: <20250530-rss-v12-2-95d8b348de91@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 3 Jun 2025 11:20:06 +0800
X-Gm-Features: AX0GCFvi3ezIBQa7yKxnmidSOgr8eNk-oM266seJU5yCRwglxX_y22dfD-57w2A
Message-ID: <CACGkMEuwb+EcT=W5OwbZ=HOf=d56cZFKF5aYPx0iCLOZ630qNQ@mail.gmail.com>
Subject: Re: [PATCH net-next v12 02/10] net: flow_dissector: Export flow_keys_dissector_symmetric
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko <andrew@daynix.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
	Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 12:50=E2=80=AFPM Akihiko Odaki <akihiko.odaki@dayni=
x.com> wrote:
>
> flow_keys_dissector_symmetric is useful to derive a symmetric hash
> and to know its source such as IPv4, IPv6, TCP, and UDP.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Tested-by: Lei Yang <leiyang@redhat.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

