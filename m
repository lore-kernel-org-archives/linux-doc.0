Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFC630FC26
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 01:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777944195; cv=pass; b=aht+AQbtrUwyUi6brDPElki2LpA6S7OU173ka0XIhBDbpfyhKrEG9g7k5wYceahZWpL7T0l3Gu5x1V3Ym6W74/pD+pTAZvLjipQ5WAqoC0cmfBoR/b3hMSi4Grk6B/Gug4uumLJGlRvPEyY3p0/brhWLgMrAL9YreKPIhVY7/DM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777944195; c=relaxed/simple;
	bh=Rr3wU4+uo7PsSxYrNtmT6CjW/2oWhP4X5/7X8ZQP0tA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1Qu7Y8b6jorxxuO0cawEws3HWk4kZBIQen7WUjskq3ewR26uysyQHCuKZdoBDCyhBDVt6mtEDODdk2sjDEGZEKL0VK2E8iHk0cwY9o44Yght8mzmxCYq6wm0pAjRRsvHRlDTlQL+7YWqc8NwvFRFRh+uG8XTORzoUMR+jAzVus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KL4gnMYl; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KL4gnMYl"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67be41d5eeeso4461843a12.1
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 18:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777944192; cv=none;
        d=google.com; s=arc-20240605;
        b=STUi8ZIQbtZEbRUbRCG7q3KNSE/Fr1TgYXr+KRYTwXD4VYwE97YXlPcH1O3HC30h5J
         jw8b7TEeUhlVr2cL7CbssGZsIM+0Eat4HCdh6G1yq0tVb8vEzDWOx8nfJpaoXUzgEMw5
         x8s5xmiJMkogR89JdSHuQUnxhUC3e7vo0XK4WotullbEQwGiGEtwyJGK+jPru6I+TAtp
         hj2QGMkxBudIsO2rA3A6OWGR1n5KkhV13oy7abampSHK8LDvv++JErsmSDbcnzbmm8+v
         F3pNYaAw01PxqANUMlpGaCvRezak1TR/J3eBjN9FVz84wKb+Gx+9QCjwEe8JKHph/g6o
         40ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cCXrAWmoAymL9ifKCG4c/wEuHOu5FPfo6N65MqG9vPs=;
        fh=2xXa13zfjg0oZIGelEimIkokkHkVEksfV9pFbDsQCqU=;
        b=Qm+5mZEI9xYEimFqf93jZ2nij1c3CM+VG1jSV4PpmN4uppPC3afBL1En7eLWP9OL8y
         zOyJ1Lbd++J4gvHHoENVlOy6wLzsjOqJldCjtbbXFD0xecKkcFOvlWH+mT7iXf4RUNKm
         VE33yYPGCZt8s618WTdsAb5/ctqjVx4wuk3UioAywylC3Yyz1X5n/Ng7Tf2VQFH3EuP0
         3jouPeolOOhkn3Gi0vkF5/zGajQZoQ532rOpuU/2ReOPyeKqRxQXYU1nsVxZUU6JoqFf
         shotQbv5GBCueNl4Hr1ZG/723SR+kStyycV0OOg4yXv+FV190q9u4uVIm2nHtXlDY6cc
         pyPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777944192; x=1778548992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCXrAWmoAymL9ifKCG4c/wEuHOu5FPfo6N65MqG9vPs=;
        b=KL4gnMYlcA1PF8bTf7kOe2sd5FK3/paFvLZPyIrGLO/mpUp05Wk357vRzuAVydpSzX
         fHLbvt2C2I7+x8Nc83g56+DwMz2fIJ4bxIC0suemFM5i9FulLwqe7Nb/3xHpaMeHl03b
         9IDX+bvC2KLMQDPuSD7PwNN7SqpfDQ+iKXase/bJmSEFlYE7g8eKnc5qSVvJCTAHEbKQ
         m7iixZKURyplgTeE24eOIsNftklf9pyN2rR/PDdm4fHlwp0l1KSIStQf3pIxV2cY++Qs
         Wa+/E6sB+cdfVjMLI7n51C2VVKvrjMQILqbdBfIr1mq7BkhQpdDi3LVet4vUo2v4eVe1
         NElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777944192; x=1778548992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cCXrAWmoAymL9ifKCG4c/wEuHOu5FPfo6N65MqG9vPs=;
        b=aF801loXZyqAHuV2icVFw9FGbF17Ff0kaRGVDBmpL/0Nj5kyWyZTLQs44LPuL2X3ne
         r21x8C+2/4dqwbQ0qMyC9Nuoas2cH3qywFdXkwHgoGCpf2biq3D4k7hmgUW9dEaK/TNn
         S5dMIdDJbPYeFB9JM1p4HmGz30U2DT0B3YeEWobQxBF0w4W7QzmrDs05PgiwvwInSZwI
         GkICNCi9ATB5xSvqDiXyFHBpzJmiEBUD6uy1e2wvM1lFcQIKWC8rpknlYTBCCsEzKIRf
         lavGh5fUuiQztU7XqE+WxUmNXPwg6DKH75akoqVK0RD3e8l80eds/aFg501A8GRRwgTt
         i0eg==
X-Forwarded-Encrypted: i=1; AFNElJ/z1y/+Tkap6awDNkkdbtNGxJr5iX3VhWq9UwjjaB5wLKaauWiQZd1D4+HP+ZaQDAF0wBdrNwQQTbs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2VXsrcbszGrn3xYo+WeUdpjN4bACB7H5jOKy3REpF8F5kAdP+
	ToyTjzMgUy8WlgjPA9dv7KBWSKJVY+myvuRL/7q2Y/SceJRWKRPjcO1Fv2DfNQ79E2emxlCqpSM
	tD40XnBxYGPHcEgzPTqktMxy+AcmtyFs=
X-Gm-Gg: AeBDieuhYrhA2HR2RW5QIM/Y9s3VnWASH9nY46SyWTyMFnIoycmNiT3GF72q1kKIgSx
	SwIx5SqVaHHG6sJHC2JKGpMaV+kmNu8PayvRVyTX8m68dbaD79SLDW37v1DCgC1EDwaDQb6RBYP
	JaP+Ma2sKO90wLIYc0nwHyedvN7bzixHiEkLPyYhSf7ZsKX4nezPG6Jp2vik9kRPQ0SFqSSkprr
	5FKfbLO5WsOTGSvcjtCRfEs2piL6fvH0i0KkDs6DAZWGqVpZ3SwQPLizUBI9ZWyLooetbMQWvnY
	6xcLGM+HLvp90IGkozQ=
X-Received: by 2002:aa7:c904:0:b0:66e:43ef:2951 with SMTP id
 4fb4d7f45d1cf-67c19929fdamr4132069a12.4.1777944191864; Mon, 04 May 2026
 18:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com> <20260504163915.4a8b028e@kernel.org>
In-Reply-To: <20260504163915.4a8b028e@kernel.org>
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Tue, 5 May 2026 10:22:58 +0900
X-Gm-Features: AVHnY4Ks42sm_qgbhHJDSLEyR_36W-fEa54mnTPR5nGVrmyYGFlRodbG56Qn8nQ
Message-ID: <CAGCJULP83NnaX6HAqwb3umDXsxN8LH48_gPpJ_3gG8_xA96QNQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] seg6: add SRv6 Mobile User Plane (RFC 9433) behaviors
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrea Mayer <andrea.mayer@uniroma2.it>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2026=E5=B9=B45=E6=9C=885=E6=97=A5=E7=81=AB=E6=9B=9C=E6=97=A5 Jakub Kicinski=
 <kuba@kernel.org>:
> Could you switch to posting this as an RFC until you gather some review
> tags? Our CI require manual intervention to add the necessary iproute2
> patches, I suspect there may be some uAPI changes therefore requiring
> iproute2 changes here.

Will do.  Yes, this series adds new SEG6_LOCAL_* / SEG6_LOCAL_MOBILE_*
uAPI in include/uapi/linux/seg6_local.h; the matching iproute2-next
series is posted separately:

  https://lore.kernel.org/netdev/20260505-seg6-mobile-v2-0-93291b7b0134@gma=
il.com/

Just to confirm the workflow you'd prefer: should I repost the
current series immediately as [PATCH RFC net-next v3 ...], or wait
for technical review on v2 to land and fold it into a v3 RFC?

Thanks,
Yuya
