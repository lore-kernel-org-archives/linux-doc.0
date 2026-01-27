Received: from mail-yx1-f67.google.com (mail-yx1-f67.google.com [74.125.224.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBA5314A8F
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 03:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769485829; cv=none; b=JX8dxeVw8TQATjb58PSs4c8C2hpZBB/SFFf/hk0V60SRsBME6huQZPHfKZCTaPol1yeAULMqUOFJI1F36E3wgQ6zM1tlv13iZAj2UkoGVHXoZBNsR+PuqFyCLG4tsV5YJHEA2nSYI/Ov0g/Ef1AlEqyOzSWDFpoOrFP/La/D8ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769485829; c=relaxed/simple;
	bh=XFau8Jrxlk4LXIMH1Jv2O6G95Tj0q5XrMIWKxPxgJns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmXeR9EH4wpNPn4jSrlTQtKfW6B8VD21TXNu48jt9Xk7fAmBSf4dQVl2bqEzyRppZQygQ3DquFyPnD/t25BBZWUFgsI6ywZQQQeoBki9LtOnpwUUY47ce1B2Rj8Vf2lg/KU5Tb4++4YdgxClJCHdK/UCBBxQOBguF4450Jpk+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OlHmRwF5; arc=none smtp.client-ip=74.125.224.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OlHmRwF5"
Received: by mail-yx1-f67.google.com with SMTP id 956f58d0204a3-6495d592c10so4120339d50.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 19:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769485827; x=1770090627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+wIYgb+a7uSPkKcjbr0/XF3iL0gwOJMcDzBmEVqlYIw=;
        b=OlHmRwF5N2BKtQa6utkLg9IHGGN7ZPMa2V/Pc+0f8qpSSBM9BGLykGo6u/U6L4Y7vH
         GomVPA76dxPIlicZsiR7ReiF4N6UtZmem+77uxvrvM6MtI/p3ck1TH504E2+mL4qiLP2
         XlJEqFvtAktkva4UZZ8lyJHf60oC2+aTDUXR1/PmtvqxW0wchMpspvqVRXDUy40V94cb
         r3O7TfAq0pab4BTENotmBSBVo5jP6KHv4n15utCs8HFRL3XkUPU3Ga6rDRlEW7iS4i6W
         +KSDsgMkBCzWNHJxlcoUk+IXsB/GL3sBjMy6+PwODHHaOWzag0tz7zpGn+xU0l9pMsyn
         PxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769485827; x=1770090627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wIYgb+a7uSPkKcjbr0/XF3iL0gwOJMcDzBmEVqlYIw=;
        b=lIbd1eArccpHG1qwIzXdE4hzyeuYOQXHxNCNOorI00XLjNUMe27I72fnfwgAkYXWP7
         J6JwGAyhV9j5G8avWbunPzIrzM4puGIb7bkkVZoX/LIV0MBieiB4fmPS7JbjgvJWH4Ho
         bNXaATdUyuJFzWAmxwqXR11DZ+ZfA3WS2EcNFLwGCXW6flzPXhO6uR4+Oi5YDGJuOhKk
         iyiJcY366EVH41ez4etrAQumy2PELvfAnJjwHQDB+QVIn+qaPNu8r/1ev1ZE1MLHbQoq
         UTnH9K7qA7/ZRTffI0Ja8n29fRRKZ8AeWE6XbZSRW82Z38jNvnEcVfK5GAwKT/HMxh8M
         f60g==
X-Forwarded-Encrypted: i=1; AJvYcCVhZNBWPACMs5wKoEcEu5gtz6VmXdtwy1BpsAgrNQvJ2DhsPEjdS640Do2aaFflh6OJ98LLxf2Fb08=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx41cx1Z+yTwasSj1kQj8po7K1TaTgy2q+VwqSezEJvmolwLlap
	zr9FK5lgIdE/b870yR8ZkDbysyrfZFuh16Q5ygYEXhgEhf3Q1ArihMx3
X-Gm-Gg: AZuq6aKhApar1y4tn6m4GmElV1I9kAo2vw+JdgAHU+VqwgUO9ciAwGK8UuXa3+QLoZZ
	WvexZCsZ+7mwlQlt8n5tKU/kO9pd64jFjVuK9Y4CvRNyL5iKpixG7ay9Kzh3ZuqSCujybySgaEU
	Hz4RptcVSvIO1zqIbIYcR7y8JSTSbpXZACiyNgdAoVklZT8ytDFtVof3+c0ujXvpmmkfLU/VSqm
	fydb3CiMfNJlj6Guawo+jXusXxl1r/5UTQ9CtlOGXd8mIahxK/cqRExsGeBFgnnH5AiHYVX+8kV
	rLcP8WNvhu7VBu4KNALGdA6R1mZflOSc0qBlsYvE/WA5ukCAeZkrJ5F/P6qnZEcPRmKtVOk58gP
	ToMH/6W+aH9xQuy/vsFL5azysTbLRMkJvFlwko5Ypk5zEHgDUBs2aPwoYEQ0DfimgwiKAtkxc7G
	IsGiJeqdF3w6/5yMn3xeqk7ofRlBAB2ygkeRWSGHQuvvOOow==
X-Received: by 2002:a05:690c:88b:b0:78f:b0d0:bd71 with SMTP id 00721157ae682-7947aca9140mr2169367b3.62.1769485827182;
        Mon, 26 Jan 2026 19:50:27 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:72::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943b2a2cf6sm56637077b3.33.2026.01.26.19.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 19:50:26 -0800 (PST)
Date: Mon, 26 Jan 2026 19:50:25 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <stfomichev@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	David Ahern <dsahern@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v10 4/5] net: devmem: document
 NETDEV_A_DMABUF_AUTORELEASE netlink attribute
Message-ID: <aXg2AQMMk3obScYD@devvm11784.nha0.facebook.com>
References: <aXGNhEKOhkTHbJvw@devvm11784.nha0.facebook.com>
 <20260121185021.446b00e8@kernel.org>
 <CAKB00G2xNvfiV6J3RzKDs=GHMGZ7L16+VKUYLGjpZdOrLnSYKA@mail.gmail.com>
 <20260121194615.33dc0812@kernel.org>
 <aXGib0OcNdHTLyZN@mini-arch>
 <20260126172646.2e5af2d4@kernel.org>
 <aXgjVb5PVqdPM10J@devvm11784.nha0.facebook.com>
 <20260126184440.755a55b2@kernel.org>
 <aXgryaSx9CzFR7kv@devvm11784.nha0.facebook.com>
 <20260126194359.461f908b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126194359.461f908b@kernel.org>

On Mon, Jan 26, 2026 at 07:43:59PM -0800, Jakub Kicinski wrote:
> On Mon, 26 Jan 2026 19:06:49 -0800 Bobby Eshleman wrote:
> > > > Then, if the dmabuf count encoding space is exhausted, the socket would
> > > > have to wait until the user returns all of the tokens from one of the
> > > > dmabufs and frees the ID (or err out is another option).
> > > > 
> > > > This wouldn't change adding a field to the socket, we'd have to add one
> > > > or two more for allocating the dmabuf ID and fetching the dmabuf with
> > > > it. But it does fix the single binding thing.  
> > > 
> > > I think the bigger problem (than space exhaustion) is that we'd also
> > > have some understanding of permissions. If an application guesses 
> > > the binding ID of another app it can mess up its buffers. ENOBUENO..  
> > 
> > I was thinking it would be per-socket, effectively:
> > 
> > sk->sk_devmem_info.bindings[binding_id_from_token(token)]
> > 
> > So sockets could only access those that they have already recv'd on.
> 
> Ah, missed that the array would be per socket. I guess it'd have to be
> reusing the token xarray otherwise we're taking up even more space in
> the socket struct? Dunno.

Yeah, unless we just want to break this all off into a malloc'd struct
we point to... or put into tcp_sock (not sure if either addresses the
unappealing bit of adding to struct sock)?
