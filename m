Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D431448DC
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721815469; cv=none; b=NpCDpJZo9NT9aRuveoGAMhxUm/0gpqQhxFcADyDG9wA0awRGpnuUTWKnHeIYE+i8zlL6mfAUNI3T3KsD+i6+Lr6XXe6S45uiC4dFQimMYItYjKkrkk9NRDgnJBUGgcx5uO1+bUyDkRBxHWE1szitEZyHheNWT9GM3fbL0rRnXFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721815469; c=relaxed/simple;
	bh=0ry878GYOIw6TZ5+EtsbRvu5e55vhpxkxNMAAdNzsds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hl2up4ljHalhX+er9M51CSoZM8xvHaUqRU+qdiP7+jQb9wZ1NO2wsQvFC9aka26+OQEstZQU174rF/kMpKfCSra/yDaA4GSVTTZMC7eCMFhf9iIhfpfl5b6KgdcsIgbAhfL7kbnQJdhM3p4X7XhCrXCnamlGfH11VYjgatlB2c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wFankBZG; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wFankBZG"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a28b61b880so11192a12.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 03:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721815465; x=1722420265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ry878GYOIw6TZ5+EtsbRvu5e55vhpxkxNMAAdNzsds=;
        b=wFankBZGuwtSyNoPFQBmld4LqNqI9KBS+o+8Cc4jR9KwLoCuG56CTxeOMRpBK2xyKh
         9BaXqED1zm+6fKtGEMn4XMNc7zYQPc9FWrdixsYLP1uGKFlaGcPNvMCld+zLkMPkV/uB
         xqdFbxsmfZDVf4D7T4frOs2U/QOa9AwcH6sedpTnE1wcPwFAr1wF/Xnu5I393SBeNjt0
         wr9l0yq6qvoA204tErMoPUANRvzS3LRavFBUxS3rxNkw04a8zwqzPl8ouQ0t66oLYn09
         i3KiYPEBtP/twK1QvRbhgXgDxX1kzwD6TVsRpBYnqAYgR4hzOEh9iDXudATc5qU7u8J5
         oMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721815465; x=1722420265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ry878GYOIw6TZ5+EtsbRvu5e55vhpxkxNMAAdNzsds=;
        b=ZMEcg/oDrz1CrBCFhxXDLWu/YKD6QZIYFrzmDzzVW9ePWp/OnNTpXI2MfLi13Amnu0
         pth75hytN6Bn0QKGqC1qDm1g5W5odcGJbvS4QxrNDhVoqOGCFa3mtiP/Lg+fskulTnqg
         SOkOKGIbsmJko6W6Ky2UEHocoWxQlvqC8emC7jL9LqKCZShoGnL+9pePwIAhtgwAaA17
         F21kDP269/N7E+7MigDzR796R8k8i/g+T2Oim1xPCP4wtRyGESgZo0sO99BbjWJOhQhM
         e/pJFe/9Du9ioQNaCelCDxaibT4UWQogieATOhZgK4daRQD6IVYY0Iy3NpJS0jP9XofL
         tYhg==
X-Forwarded-Encrypted: i=1; AJvYcCVp3pFesMfqdRomzzSh01QQTKSD6DHZ954ijKnThVi+q+uE/esVx5Mv843PmwgW8PJBPjS8+1c+LAQvtP1dYu7vM0aIRQ7449v/
X-Gm-Message-State: AOJu0YyO0y3mG8+nr3czqvD2ZfEZQ+b5xNWJ2bedAeg2jKAvlEAfMO49
	bpujWO6GuUDYZY18lF5ElEA0BjQlGmShH97fR4TGKAiXeVFe4h31OXUbgrXaRpUAUbM+wCug0AM
	bUH0vPC4jsPnO74laIknq6SzWnUUZEsYH25Rs
X-Google-Smtp-Source: AGHT+IEdJ41Amqd1U+VYaV+EHraFq08EiG5z+/hezqT1qwO8csrJKX+iy6AtC9wIeKNmElPRqZnvAcO68SIb9kkEW5I=
X-Received: by 2002:a05:6402:51c9:b0:59e:9fb1:a0dc with SMTP id
 4fb4d7f45d1cf-5aacc18dcddmr188773a12.6.1721815464424; Wed, 24 Jul 2024
 03:04:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202407241403542217WOxM8U3ABv-nWZT068xe@zte.com.cn>
In-Reply-To: <202407241403542217WOxM8U3ABv-nWZT068xe@zte.com.cn>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 24 Jul 2024 12:04:13 +0200
Message-ID: <CANn89i+C=trNKcg0WNW35t=dM=0Qz_G6o1XzfDM-7JD+wFmL1Q@mail.gmail.com>
Subject: Re: [PATCH] net: Provide sysctl to tune local port range to IANA specification
To: jiang.kun2@zte.com.cn
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, corbet@lwn.net, 
	dsahern@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, fan.yu9@zte.com.cn, xu.xin16@zte.com.cn, 
	zhang.yunkai@zte.com.cn, tu.qiang35@zte.com.cn, he.peilin@zte.com.cn, 
	yang.yang29@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 8:04=E2=80=AFAM <jiang.kun2@zte.com.cn> wrote:


...

>
> Co-developed-by: Kun Jiang <jiang.kun2@zte.com.cn>
> Signed-off-by: Fan Yu <fan.yu9@zte.com.cn>
> Signed-off-by: Kun Jiang <jiang.kun2@zte.com.cn>
> Reviewed-by: xu xin <xu.xin16@zte.com.cn>
> Reviewed-by: Yunkai Zhang <zhang.yunkai@zte.com.cn>
> Reviewed-by: Qiang Tu <tu.qiang35@zte.com.cn>
> Reviewed-by: Peilin He<he.peilin@zte.com.cn>
> Cc: Yang Yang <yang.yang29@zte.com.cn>

This long list of reviewers, and having all of them missing the
net_rwsem requirement
for using for_each_net() is alarming.
