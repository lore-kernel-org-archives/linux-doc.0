Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53883185B67
	for <linux-doc@vger.kernel.org>; Sat,  8 Mar 2025 06:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741416102; cv=none; b=g8fBW6qEmbnNd7zD/8cg+Ie2Ghbdzb58JmfwQiJYUsF81LBi/RPxoKemfRbmO07KcLoVNsqFUDvQensr+WUv0e67PlFkhXFe/dwGeA1fzOt11M80SUp20+hxd334Wy+5QzuuEnhROi50EId0htdCyoqJd/Q7Msf4NjL0pDEY3cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741416102; c=relaxed/simple;
	bh=mjXPEAUzfnISY0ZB5Qdk6ZqkNFSViNSHUixjtjhaCsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=adYUzpEbq0RRNumQBne4KkfxRfZSNoaiVZ0o333zaqUpXo0Bcgkpq+Z+WF9T71bKPbBqzDzCal5ueILjKw/GNy0yp8Ud8V66A+yMVTikoZmu+ZXj9xnUkuOyVAlQ9sYAh/DRU1ELRQavKdXcOX7FoY2fTeuPSKdtSD/dCZsOZMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tdYqKpo5; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tdYqKpo5"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-47662449055so3443111cf.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Mar 2025 22:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741416099; x=1742020899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjXPEAUzfnISY0ZB5Qdk6ZqkNFSViNSHUixjtjhaCsM=;
        b=tdYqKpo5mktSxKY1FOn2TiNPTX/sYR8C0/Smr7KIz89eGpSvzxW7jtlR8SQ9GeOh/i
         Q8JRRCh6OXkQIuJWyEfNmugd9CuexhJbII1B85AubppeGD28u8gJVU4oRRSyHnaSgY+i
         XwQgXorFsprEO68HuDnGIBHRbB7Pno+R4WVVZE82OkPhbiC05fDJGIxmsbyS7Zb2M+Lp
         x7iVvm7W8v4VT4GZGxgCOZNcpitU2DewCeIEz5J1gesXKl7w7WURMsFoOMUs8WOFNeHH
         2Iej9yyXfqc1gfzVZ1FdcRrllRRNXi50icRRwnDvBk/6O3kh3ti03iwADk0OZJC0Xs2O
         rdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741416099; x=1742020899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjXPEAUzfnISY0ZB5Qdk6ZqkNFSViNSHUixjtjhaCsM=;
        b=KUQQX3F1C1RByMyaefdrhCb6Hq8cSn75zloviHoQKP6g/oSBm7GiXEt6iDnw845av2
         0DLpw9trsya7iVW4+hLA7qVbvGIjmCvUDLOVrzRGQ7bTvNDroO5ZP8iKJdKEWYgbHxm8
         6jeu+ZNGqWboSSMlzaQpyGRfa2GFZy92qGdg5OkkomsP09wtwrUzgT4lsQBcmIc+Bpa3
         X3aj2B96u407MRDszTRJ4z8kf4i2tTq5i+3TAOTvfZ9kwdyJ5GLhDhJEgkXdREBEyAc7
         F60SeqO69f5ss3iflEfgdhVMd0mxCSgcI6HOKAwDcuYSQRujXbmGQ+bi+uwOJrL75U1M
         71wg==
X-Forwarded-Encrypted: i=1; AJvYcCXNW1mrEs2G6ZSalmCYVtfpMlOD+kl2jPGDrK+kQ88Eb/C14owxIWqxbVMa5IMHYeNpSsfi7OBXdl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwORRMc90bZ5cnRrE7bPGifaPK+XmSKsVkmdC4meIELOkWtoi2K
	IvnnCrmsw+uw344098sPySD9RLutd74RCq0Nq75uTi4RBAk9sGLv+CuI8pObqLhgv6eX6ZWRvET
	46YrxP27Ye0QBcisvvsizMGXdxCYx9UQTRHQb
X-Gm-Gg: ASbGncuCd1EmmlBVpc5UVI6PMv9yCgB+hkRAEymOlV+823ffBeUZD0KZ/r0O9aqfOKd
	nNBNvtq8TQ+gR/2wlg6eua5tMW8VDiERP9o/NMBq64UCbMPjM7pqep7Sf6hkSrD2/+R+iz1CKYv
	lJK7uU0V1QYBGg0ZC2iF9GgZMbnM9YopejVvM=
X-Google-Smtp-Source: AGHT+IH0eaLgh+XEDCWC3SYaInWPdIV9YE7cJpJB2zom7UsiOlycuB30zhF8t9x6msXH3oGPL8h6ICGxTYOXbXt0l5c=
X-Received: by 2002:ac8:5d52:0:b0:476:7327:383e with SMTP id
 d75a77b69052e-4767327436emr891981cf.13.1741416098891; Fri, 07 Mar 2025
 22:41:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250308044726.1193222-1-sdf@fomichev.me>
In-Reply-To: <20250308044726.1193222-1-sdf@fomichev.me>
From: Eric Dumazet <edumazet@google.com>
Date: Sat, 8 Mar 2025 07:41:28 +0100
X-Gm-Features: AQ5f1Jo-nG_abX2mxVG0F6FyAQP3SKkSj2fRU5w8sH3E0_u7XuD1N8-7npTR7nI
Message-ID: <CANn89iLV6mLh8mWhYket7gBWTX+3TcCrJDA4EU5YU4ebV2nPYw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: revert to lockless TC_SETUP_BLOCK and TC_SETUP_FT
To: Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, horms@kernel.org, 
	corbet@lwn.net, andrew+netdev@lunn.ch, pablo@netfilter.org, 
	kadlec@netfilter.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 8, 2025 at 5:47=E2=80=AFAM Stanislav Fomichev <sdf@fomichev.me>=
 wrote:
>
> There is a couple of places from which we can arrive to ndo_setup_tc
> with TC_SETUP_BLOCK/TC_SETUP_FT:
> - netlink
> - netlink notifier
> - netdev notifier
>
> Locking netdev too deep in this call chain seems to be problematic
> (especially assuming some/all of the call_netdevice_notifiers
> NETDEV_UNREGISTER) might soon be running with the instance lock).
> Revert to lockless ndo_setup_tc for TC_SETUP_BLOCK/TC_SETUP_FT. NFT
> framework already takes care of most of the locking. Document
> the assumptions.
>


>
> Fixes: c4f0f30b424e ("net: hold netdev instance lock during nft ndo_setup=
_tc")
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

I think you forgot to mention syzbot.

Reported-by: syzbot+0afb4bcf91e5a1afdcad@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/netdev/67cb88d1.050a0220.d8275.022d.GAE@goo=
gle.com/T/#u

Thanks.
