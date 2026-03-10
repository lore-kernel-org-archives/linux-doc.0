Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4087E3A3E6A
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 22:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182083; cv=none; b=FpvGSDD6jXXrntTrbWjGmPXSVqKNL+eKvSgdazXHw5qaNbsqS7P2tvJqf5PrWXOPBKB+pqzQrgMyPC6pdftiMqH55CMv5lyQarqitg+1Rk5+nNIADouxpr+vRJXKL/W3+maL5lTC1H3MyfYnp0tcoejrOB1wIeZz8XHbvBy5gW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182083; c=relaxed/simple;
	bh=gA1+6V/KieO2PhMuLUC9X+yRGVh4ZS5XyQKNHLvoAmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cD9p0d15gCrheABNbXrVRLy2U68QfSxekUOEpQw3ga+xRxxsgS1EPtq23klU2FtrwBm/jttQYsdcv9QaPxX4UQTsXynVU9kBPP8xWVBnaQAdfQ2MlLRnNMoaDsLK8xOBDQfYuCOKVXgdMpmbpxh5OT1l+NmjY7JCnzVD/8l9YJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxC2lXFK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxC2lXFK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-485445e80bdso10816025e9.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773182081; x=1773786881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gXU4YewdIeXEw5CIQLJ4hSfe0f5ekUOc0dg0Lb4JccA=;
        b=lxC2lXFKmikseA3TsZfT4NIQsK7xWAcFkKW6J+HU6f2PT3X4CBsQezAGCyWm9gFA6U
         TiBJYbaJnI22lwBBBmNzXhzDx/IMiwrNmyy5uROFPdM1/3fJC9ejwHcBfTGy7PoUjmDW
         Ec8NyWghX7iis/PLFwjHXLPJb5DeNvcJnzp/gPq81KQNdCLVkEO+uQT8DiifUq6kPxc6
         PZaMJzw1+anMtAsCEoat+wkGd8ntDu/rwfU6A0qlaAsU3VFOWnXb1vIl9t8KLHyM/B42
         EnvUMtIw4o0hm0vMSffj4H8k6JYZ7vJIKxLyh1gMcc7jyOA+9wlI2I37BqvTjT96ZoFE
         4nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773182081; x=1773786881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXU4YewdIeXEw5CIQLJ4hSfe0f5ekUOc0dg0Lb4JccA=;
        b=igur/8VFnNfM9vqQwQKy3Q5AbFOB4Q8L380XXX0lo37mizP9Q2Y7URXijN5Cu9xsIT
         Z9SfxUG+Edb2d1sKh6+LzgHayO7MBPMbO+oY0mq8UWZDH5cEQ7VPL9LmnP3s+DV6Rn5P
         5e6kIHcHINxhtL6bprSX+tlnOTgDgs7W6Jh4n2gJVvkgq+ks3uliSWwUHYdGYeCXM8mI
         F8cwh/sAAFpRxAL/62Id3Vledcbmzop7NMI3zCFxYi4Pnr8PO8PQ5je+qPWIRkKyUq2F
         hlYgNXGLxuGMNaqCNyhF63dDBMZAWxHnhy1VGWTy9qjCyKOcDqAzRI7bBsTXMqab637m
         ZdPA==
X-Forwarded-Encrypted: i=1; AJvYcCV4zw5Hvf8Qm3F3AMkSjiXKQkOAd3DiyS87CBuxwNN1Go52RqBpiQMvnEDNsl/45kmiKavI8DRWZLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl1AXQAIkUmE01RBB6NjoNqnvZL3HxkGCLNKCsCGYjvWTPJe0i
	RfARQy/L8hUfYotVz9uwYHKB45yGf1YqZJlH3saLl3Y0XJ3DABZm75xq
X-Gm-Gg: ATEYQzxJHDrkdcqjF/nEQL1yRkEu5nqHB3r2zhoUMtCeKywM425FSw1ZOPK5qGlwgN1
	YF2ihSvftE7nQR1Uu5yR568RjfhhY48Ax0P6pr+DSvvgZqyv4ksCxc7EPOTrFAhJf/Lo9PyqTOm
	0gKqPHDVcPh2G/xGfOBnZUSFHyNhKqqSCvLIRxvqiltx2me45SXTjvVJOGxSCbrdFfef+ByD+ez
	TPYaWUnd72ol3liCXex80+lqSRBl+SrFNmlwwO+7/0R8HhZ1ZFRq4I351XYIQapajlSiGkqsK2o
	TRntAb+IUR3XGmHG+gANyV8HJigwReZJPGD0VQ73sg6vua15479tbXFkB3a0wW0ibSNZna45fg9
	NQtjwjJqm186MNJG2EdBCzdUwywiToC7j/0nJEbDpvLG+Xt7Uo6Hofn1T8nUf/mcaezOJPeHUy8
	BdSrzO1WMCXti5iC4q4dSxwWD4sZciqH8c13T8EsUoup2HV8PN87N0weOBJrjlq0IOL4CJdZESv
	HdQFRow5af8VpaLdXHOgIA=
X-Received: by 2002:a05:600c:1f8e:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-4854b0ca217mr8508535e9.11.1773182080137;
        Tue, 10 Mar 2026 15:34:40 -0700 (PDT)
Received: from gandalf.schnuecks.de (p200300c14f1996009e6b00fffe39b8a7.dip0.t-ipconnect.de. [2003:c1:4f19:9600:9e6b:ff:fe39:b8a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a307bc4sm7973655e9.3.2026.03.10.15.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 15:34:39 -0700 (PDT)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id 21673302C729; Tue, 10 Mar 2026 23:34:39 +0100 (CET)
Date: Tue, 10 Mar 2026 23:34:39 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Ahern <dsahern@kernel.org>, Jon Maloy <jmaloy@redhat.com>,
	Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com,
	Shuah Khan <shuah@kernel.org>, Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, mptcp@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/6] tcp: implement RFC 7323 window
 retraction receiver requirements
Message-ID: <abCcf1opVAr8CvpL@gandalf.schnuecks.de>
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
 <20260309-tcp_rfc7323_retract_wnd_rfc-v3-1-4c7f96b1ec69@gmail.com>
 <20260310095806.121d198f@elisabeth>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310095806.121d198f@elisabeth>

Hi Stefano,

On Tue, Mar 10, 2026 at 09:58:07AM +0100, Stefano Brivio wrote:
> Simon,
> 
> On Mon, 09 Mar 2026 09:02:26 +0100
> Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> 
> > [...]
> >
> > diff --git a/include/linux/tcp.h b/include/linux/tcp.h
> > index f72eef31fa23cc584f2f0cefacdc35cae43aa52d..73aa2e0ccd1d7a6314a00c27950b019b62a3851c 100644
> > --- a/include/linux/tcp.h
> > +++ b/include/linux/tcp.h
> > @@ -316,6 +316,9 @@ struct tcp_sock {
> >  					*/
> >  	u32	app_limited;	/* limited until "delivered" reaches this val */
> >  	u32	rcv_wnd;	/* Current receiver window		*/
> > +	u32	rcv_mwnd_seq;	/* Maximum window sequence number (RFC 7323,
> > +				 * section 2.4, receiver requirements)
> > +				 */
> 
> I didn't follow the rest of the discussion but, at this point, what
> does this mean for applications (CRIU, passt) dumping/restoring socket
> data? Do they have to adapt? I couldn't find this bit of information
> anywhere in v3.

Based on our discussion, the "Setting the TCP_REPAIR_WINDOW socket
option initializes rcv_mwnd_seq" v2 change addresses TCP window
restoration.  As we said that information about window retraction is
not crucial, the window will be restored as "non-retracted", matching
prior behavior.  Therefore, there is no change to the information
that applications need to dump or restore.

-- 
Simon Baatz <gmbnomis@gmail.com>
