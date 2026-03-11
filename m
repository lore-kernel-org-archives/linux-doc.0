Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D521372B27
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 22:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266894; cv=none; b=EsrkFZJgq8lJjO7Jg5qtTYLoDw7oohAzQLt1t4dKT5Ia1zXx6OptmdbzNYP7En5RuCBGzBbNwq7UA1H5WLrxKCRBntx9H5HWC/bnSCW7cMBo8AjmUf4aQPy3ZeF59vZFzpT3hBE6TG1mcQlujH8Fa5AKPMCQxodB/kcQU8HPRSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266894; c=relaxed/simple;
	bh=eckzTySEcXipLe+VU78GzpoVPoQ+1K7RQ8jMl1qup7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLxwwCDefsThkNqYUsxdliBcF+Zc/J5fVCMcQOtVqS41GoBxSJ1XFl8P6kGPMI1mi2+1afsTYTNgfmhuVy+c372lSbm5FrAOchZkvQgrkGwiX8gbBxbNUIV8NR/3Z14NkW5d7YzGc+M9nLO7JfVRHCQbxZhgcNhzteCRcOZHcos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2ajF0F7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2ajF0F7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso2657315e9.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 15:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773266890; x=1773871690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jXJIXQ3qsiPhJua6yI0vMRP9sGOp7VDYpCWyFHFNhZU=;
        b=m2ajF0F7tZ3pWTkmxKLpUvcukAjc418XjqfW3veoVlHoJf/+u6zefr92CIEXoZE65+
         N+c0izwroUGApIkU1EJaMw+0dC+KnGd0e9QVQcmEOi1/82fpm6vN5A4VzvS0q+Rs7RMt
         d3P3z2CndMqf9v48cUnC/PXQ9CmRIDb0bmX9brh+H2L6OVefBA5W1uN6VuOIhOxpqVak
         nrwi1GYtK3NHOmOT9JAgW9ABrz7561JZokhXkdx3G6kWc4UBbmdQk1TRPhP9Mycb8IMr
         KfKC+BMcjJfSZv4OVsZymuuD88+Ty0WkuwE+27mP+qt7FUX4vhy3oNVUeQ6yvQ1sRPc8
         86mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773266890; x=1773871690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXJIXQ3qsiPhJua6yI0vMRP9sGOp7VDYpCWyFHFNhZU=;
        b=n44aqL+JxRTylQu2ZmjUNJaO56kCHYi1fvy1f5XEO8u9p9e3wjwp8druU7nNojNGxb
         lr9YUJsD52PtbgfcLeF3EiWEx3Tqpp5zBQP9h0BwgTWk+AQOalvOx79KodvvQiWLDxqe
         Yf8QDgjqM6ce8XHqh6SlHBiMfFeLKpX7iIdWucSqUTuKbiUq1GF9DDBQA7zfWtudjkXD
         GouMxhjR/PlFyC+2PU0PGK6klaSg548zbuC70JPj+wVUVSo6Mx1A8yy18p/l1S5oZgbw
         xnw5geYbuWWlydoHPF9eG6HhL0vqiZl/Xz1T7qo/m9uPicWF4KzR3XG9DHlqrU6LFcaZ
         QUuw==
X-Forwarded-Encrypted: i=1; AJvYcCWUiUfbdsGc9p2nlgyD3MH9WC9ndqiPTT8WkOy5Z1BYC8UVi7+yq2nsq2jhCH+O5mO5cH/0X2Q/Du4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEkV7kgfGPlmbxocFX4gG0jLpObr1aarSUlMhF3K0uwsW8+lqm
	W7djzgFDHVFHUReEOBGcciMOz28z40koC4FNEeJFDRyX9eXx3XwRzZFH
X-Gm-Gg: ATEYQzyRirzHgyrBDA839z/wRnnSKuhv/XrzdgGyZQsdfVwYPujuWGbd0mZGiNeQ5Y6
	4byhaIQjog77bcrQaZFh6LxoQy9ph4ek3EdQHD4lalsEAgGlt1ZN1Oxt4UFv5fZ33+6+WnfYfb4
	Q78GefXrvnNrfRbOuCQQhc5yB27sHx/yM0MnwET1TOWaqrFJyH6i8XeWewOUzXJEBDKzfJOCJI/
	gTFmVfs4yzhy3FxhZ/cyNxc64/wxdraDUy0XEfMCwDHc7/JyJAoaBDLptk5sCsqz4YCWAIFgtZz
	ilgaGDOccwqx+bMkn7ais14KQDVcC3rxrQ6IIeKog/CvCJdjDu4/DQpenw/3NL8YC3s+IQaw9Z/
	U9tKFzR5PVezjroKwgjgaEqvIQ1KbLTVx7tQGA/dERp3XOGBwL85f+ARSxEni/gSViQQ88iFTCm
	+SWz9IozFVs+DvHXRgfQTS8FmeF8cEt0UU6lZcFrJwO4bqrKIv8PUdx/82m6LE0QuFQ96C4HXu
X-Received: by 2002:a05:600c:3b16:b0:485:3e6c:aabc with SMTP id 5b1f17b1804b1-4854b107dddmr62988565e9.19.1773266889508;
        Wed, 11 Mar 2026 15:08:09 -0700 (PDT)
Received: from gandalf.schnuecks.de (p5b2e2ef5.dip0.t-ipconnect.de. [91.46.46.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm512043875e9.2.2026.03.11.15.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 15:08:09 -0700 (PDT)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id 989BA302FC8A; Wed, 11 Mar 2026 23:08:08 +0100 (CET)
Date: Wed, 11 Mar 2026 23:08:08 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	mptcp@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Ahern <dsahern@kernel.org>, Jon Maloy <jmaloy@redhat.com>,
	Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com,
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>
Subject: Re: [PATCH net-next v3 2/6] mptcp: keep rcv_mwnd_seq in sync with
 subflow rcv_wnd
Message-ID: <abHnyJInqmGNIWiq@gandalf.schnuecks.de>
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
 <20260309-tcp_rfc7323_retract_wnd_rfc-v3-2-4c7f96b1ec69@gmail.com>
 <334053df-9824-4bfe-b37c-8711d0a5a9bd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <334053df-9824-4bfe-b37c-8711d0a5a9bd@kernel.org>

Hi Matt,

On Wed, Mar 11, 2026 at 07:27:34PM +0100, Matthieu Baerts wrote:
> Hi Simon,
> 
> On 09/03/2026 09:02, Simon Baatz via B4 Relay wrote:
> > From: Simon Baatz <gmbnomis@gmail.com>
> > 
> > MPTCP shares a receive window across subflows and applies it at the
> > subflow level by adjusting each subflow's rcv_wnd when needed.  With
> > the new TCP tracking of the maximum advertised window sequence,
> > rcv_mwnd_seq must stay consistent with these subflow-level rcv_wnd
> > adjustments.
> 
> Thank you for these modifications!
> 
> > Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> > ---
> >  net/mptcp/options.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/net/mptcp/options.c b/net/mptcp/options.c
> > index 43df4293f58bfbd8a8df6bf24b9f15e0f9e238f6..8a1c5698983cff3082d68290626dd8f1e044527f 100644
> > --- a/net/mptcp/options.c
> > +++ b/net/mptcp/options.c
> 
> (...)
> 
> > @@ -1338,8 +1339,9 @@ static void mptcp_set_rwin(struct tcp_sock *tp, struct tcphdr *th)
> >  		 */
> >  		rcv_wnd_new = rcv_wnd_old;
> >  		win = rcv_wnd_old - ack_seq;
> > -		tp->rcv_wnd = min_t(u64, win, U32_MAX);
> > -		new_win = tp->rcv_wnd;
> > +		new_win = min_t(u64, win, U32_MAX);
> > +		tp->rcv_wnd = new_win;
> 
> Out of curiosity, why did you change the two lines above?
> (even if it makes sense, the diff is a bit confusing, and the commit
> message doesn't mention this :) )

I wanted to keep tcp_update_max_rcv_wnd_seq() calls close to the
respective update sites (same pattern everywhere).  In the original
form

tp->rcv_wnd = min_t(u64, win, U32_MAX);
tcp_update_max_rcv_wnd_seq(tp);
new_win = tp->rcv_wnd;

the ordering suggests that tcp_update_max_rcv_wnd_seq() might modify
tp->rcv_wnd.

So, I changed it for legibility.  Now, I realize it made the
diff harder to read.  I might have optimized the wrong metric here ;-)

> 
> > +		tcp_update_max_rcv_wnd_seq(tp);
> 
> 
> This patch adding this new helper each time rcv_wnd is modified looks
> good to me:
> 
> Reviewed-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
> 
> 
> Note: just in case a new version is needed, checkpatch reported an error
> in patch 4/6 because of a trailing whitespace (+ No space is necessary
> after a cast in patch 1/6), see:
> 
>   https://github.com/multipath-tcp/mptcp_net-next/actions/runs/22844479818

Thanks. I will change that if there is a v4.


-- 
Simon Baatz <gmbnomis@gmail.com>
