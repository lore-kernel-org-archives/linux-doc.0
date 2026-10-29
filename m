Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793238825;
	b=XcM1846fRNL3vrfnaxO/btXcp9zpiRK/w6saa+05x+y9osE3ZccaG0PO+3IgUyqWqP8+
	 NIQEhSp/5b6NU6B84mpIDSR5X3x12Jm9mUn7ixKwZl78CfHn8M1LuLV7l0JWdY9uTZGdW
	 JxoT/xFpCEtN8rxGP/jN8LstzqUJIayrfNZVkSz1grVGwlcTPR132g+CFO3nC3vWdcIB+
	 cYvWnj4VLR9eT/xpbO1euovMvXhDZEj2gX9Tsz0DkQpnv8cj2HIIRS9QDDcIg9zK/XCro
	 DUp16y1zmAEOkhXh//H8ZATVOdRZDCSHzQm2e5ctvFjvtCKGBjIVn9SL4zUfw2ixrvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N5xbfmRTc2/OENBILE/RMV+LpLgDZOf9nebMaXGSGAk=;
	b=NKqBCZc2P1F9pAQmkcra5YMRuB34cUVkymsTFi4zjXb1B/IHP0DxkF5uDv82kKXtTBL5
	 5STbpXDeCeN4+8SzbTsBg57fpj2vjnfssx1nBJ0BQNgWxJVNSD7QWJu5clKNmTCstKSgV
	 fDYkShwtqF58BvIaseo8jiGupse+dE9cy92drxzQgc2kpkzVQb7gjh1WX5vwtf6W65AjT
	 tAXfMwh/APRpXISFNAJXNC1ZtQ8W92HMmjvZbmUuCYBb0kNLZl+7+2m3gAK3XScKb6Vui
	 K+jevR4R1J9q2LEsmiH31tPKejiMWxY7zrCYuoYHSTEq3ebXNCSl5Js6fXoXj3NhKpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VJMzm+5y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F5D606A31C
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F5D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VJMzm+5y
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1981558eec.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 18:53:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793238824; cv=none;
        d=google.com; s=arc-20260327;
        b=VAyerwdNMjlm/zYPz7jCBVcQIae3fFs/rjfOUhDn9mW2xmvq2W7ZS2n81YN2+M+JTW
         EuCavZ/An0x6TR782kLzx2V4ZHQJpXUyNLTDEbyW+oSR/BEhuxMTVrblD2qiNw7nlcgi
         CXucHT7xO0DvDeLGcfO18J82LPx/PkzJmsNTlV6i6EC1DzZW8L0TtALjkg80MJ4E3WmL
         97FJF3IlNi5Qodtr8CKaknyxj84sH+3dGWR8iiIIM+iDfwEXThYIKKFu8YKP0fuLL6e2
         6CasnrAWabt7X3d93x3jIT7r0mGXIguBNIJVwJ/byWmzcScnVSJo3TLOizxP7eNJP33Z
         GbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N5xbfmRTc2/OENBILE/RMV+LpLgDZOf9nebMaXGSGAk=;
        fh=buva7wop4NBCZRfp5qG4dsf3vjzdwpjIX2fcTntrNPY=;
        b=oN3RHWKdB5PWXJt1er3H46/NoRe/vuwmCX9XV0sH5UHv/7gibA6NXWwcGCYqdE5hsn
         OTLn1ldt4AnT4iiWBA2hcZmX4t53Y5t1WzjdMF85MG1Ui+r8Bx4ViXSqfg8BE/Xhj+KU
         UPDPpJ6Dnb/KUfLiHQdJISnIDisdp4TbRHmYM7rKuOGOggQmWaYtYQI85Ruvmr68/5Gj
         W/ktl//XkdaF2Ls+5Yn8shyWX9iGLCINybnsizU37IrH5i1VLIC8YtFrZLG66v9g9F6R
         y/3oUSyegnW86QSBGB7mLlZONJljeplrllFL4Whjtd8mLtfsl1EpdfN7VH+tjDXHG9r/
         bYJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793238824; x=1793843624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N5xbfmRTc2/OENBILE/RMV+LpLgDZOf9nebMaXGSGAk=;
        b=VJMzm+5yD/wIGHVb+4KCC3ZIoBHwdyH59pUaKB4/gMct4nvQyIr2wWO9MLgEISmdE2
         uB/52VoBo5XGV2qq6eknNQRI7sDqvlynkCX6gXlIFvQ9WN8zW6sF6uMxmjYsaPrWwQDZ
         9aPPNiiCI6s9pR8d3WmkxbEvTLweIzjoXZhqaPA6zXQiku/+ST+0/BiWCNgIllf0nTbi
         4CuxBgFA36h3YyUTfk1wtsg4MxCFBsrDasyRaJJtGMdEtQyZtD5aylVNvwROoLnUWsWU
         110wWLj7m8gMQlWLPLjNm4F0y5lFAKBKm8U5+URAyRD4lfHsDAfBbvVaN5SFJxhMz66a
         wV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238824; x=1793843624;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5xbfmRTc2/OENBILE/RMV+LpLgDZOf9nebMaXGSGAk=;
        b=gjWkS2E28w953tKu4tDXYSRBe7rMzU08o8wQyo5MOXyUdA02TUYIcV04zSdUyVHvCn
         qZo5TF92TcqF4eU+UzaqkAqrz4CguNgq2Fog208U1hVjhKE3CNWNCRqExOwTC6C9j3bv
         rwJ8uwDtk4p0VhGWgsu6IefmAiQYA6wUjakwW+cwTUSxOHdCblTzNB9M61cDirmFVQBv
         d7jz0prNuaUleIG2i2QYfNL34ouXgkQxqiQIuLB03RLu1IXSz+XDwdD6A4EIcwZaAWR/
         5CKtwFIMPwojIc2W5QpOm3pM6UbVYUcATZt0SACMssEuSlkgkF2lpQ9kPeui4zQdljR8
         LGdA==
X-Forwarded-Encrypted: i=1; AKwUvByy4azR9vOczX7quLWPiCKpWGKyIK/ZItY2m9bRb/lX7zk00+OGMjVWp9k26WwXMsXpo5J78XquRQg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfhPI5AEnBmCJtXvvrw4JFpSfzUOHjBvdWBCXJxkrKM/ZWw3Ck
	9Yq3tZE4DHKijk+sdkcqNXLBsjWva5eYW1Z8pKW4L+K54GzW1dfKT3XqSJnNDcvrq8L9oCEDt1/
	/DRoLc5a0CN9WNVoZstiTPYPc6VfT7MgjFdj1dzgh
X-Gm-Gg: AYBFou2ZLg6Lur4yhPS+YH5/u5n2BkD5a7KqD9fH/a3VKPhifwV8AXy/GzPuoH3HIO1
	GX0LBZ3MtCT+PlENYhWERNKBw/SBzPfgZg9abjlaEY4KRTUCOqQh4YUr9lw2wk3g8TC1F7aSiIV
	PE7NQy/IVt3X2Mqh1+QTT6Wd3gs7QjNUWLGzSYfn/n8NLGfnW80MSJ1OgygVgFQRWHuUCQ7V1av
	Y4E2GxWAzSqHS2qgcYiNq+Cq4vD5BxU8oW/1B6KPfrnoiajZw/qW9Tk9qX6j1kB6mo5jh/Jm9ps
	NlG8VI5M8YVPWKx00P/Jw7xx8o+zXGnpiMpmxraOUm/5Hl4Ic/EZHe5GdKsj5vUi+BVmffM2Blm
	TNbnRX7KQa934vNOcb1PZjEf2YtDFfmbPMtzXOecGVEdk9yLghEJh4G0oJxkTy3eV5ZkeNHiS8i
	kbL2n0TIpI8eGf2jlyYu33vD1z+vzVbGkbBTh9FXfGIgTpLU9Ft2GRw9bm3jg+JChNBRi4awtR9
	vyIIYQTVQ==
X-Received: by 2002:a05:701b:205b:20b0:194:f017:5a01 with SMTP id
 a92af1059eb24-1a6d1f92f62mr5111887c88.42.1793238822982; Wed, 28 Oct 2026
 18:53:42 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027104701.296240-1-jiayuan.chen@linux.dev>
 <20261027104701.296240-2-jiayuan.chen@linux.dev> <CAAVpQUCBBaVmaZUv+D+a4anSbGSR_pKukYVXvRJRzSGVnjb2kw@mail.gmail.com>
 <eb85d54b-778e-403e-a5a5-56805b23b560@linux.dev>
In-Reply-To: <eb85d54b-778e-403e-a5a5-56805b23b560@linux.dev>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 28 Oct 2026 18:53:31 -0700
X-Gm-Features: AclHuK8XDsp5T4jIaX_MBCMs6DhlHPSgPvRq7TjuW4iyJKF7VUF6t-zq0kYU-QU
Message-ID: <CAAVpQUCHeydud7_NkMuUyK3tdNYLD9GrCGJiGQO6gV+r0-GuHA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/5] ipv6: restrict gc_elasticity to 31
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	Fernando Fernandez Mancera <fmancera@suse.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Joel Granados <joel.granados@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Willem de Bruijn <willemb@google.com>, 
	Maoyi Xie <maoyi.xie@ntu.edu.sg>, Jiri Wiesner <jwiesner@suse.de>, 
	Gerd Rausch <gerd.rausch@oracle.com>, Zhan Xusheng <zhanxusheng1024@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, 
	Yung Chih Su <yuuchihsu@gmail.com>, Wyatt Feng <bronzed_45_vested@icloud.com>, 
	Hannes Frederic Sowa <hannes@stressinduktion.org>, Flavio Leitner <fbl@redhat.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 6:47=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
>
> On 10/29/26 7:58 AM, Kuniyuki Iwashima wrote:
> > On Tue, Oct 27, 2026 at 3:48=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linu=
x.dev> wrote:
> >> Every counted IPv6 dst allocation runs ip6_dst_gc() once the number of
> >> live dst goes over gc_thresh (1024 by default). ip6_dst_gc() decays
> >> ip6_rt_gc_expire by gc_elasticity: the smaller gc_elasticity is, the
> >> smaller ip6_rt_gc_expire gets, i.e. the more aggressive the gc.
> >>
> >> ip6_dst_gc() reads ip6_rt_gc_expire into a u32, but gc_elasticity has =
no
> >> bounds at all, so writing >=3D 32 shifts a 32-bit value by >=3D 32 bit=
s, and
> >> a negative value gives a negative shift count. Both are UB:
> >>
> >>          val =3D atomic_read(&net->ipv6.ip6_rt_gc_expire);
> >>          atomic_set(&net->ipv6.ip6_rt_gc_expire, val - (val >> rt_elas=
ticity));
> >>
> >>    UBSAN: shift-out-of-bounds in net/ipv6/route.c:3369:53
> >>    shift exponent 32 is too large for 32-bit type 'unsigned int'
> >>    CPU: 2 UID: 0 PID: 615 Comm: ping6 Not tainted 7.3.0-rc7+ #364 PREE=
MPT
> >>    Call Trace:
> >>     <IRQ>
> >>     dump_stack_lvl+0xc1/0xf0
> >>     dump_stack+0x10/0x20
> >>     __ubsan_handle_shift_out_of_bounds+0x1d1/0x390
> >>     ip6_dst_gc.cold+0x15/0x1a
> >>     dst_alloc+0x4e0/0x620
> >>     ip6_rt_cache_alloc+0x189/0x7e0
> >>     __ip6_rt_update_pmtu+0x68e/0x1160
> >>     ip6_update_pmtu+0x30c/0x3a0
> >>     icmpv6_err+0x1fa/0x330
> >>     icmpv6_notify+0x303/0x770
> >>     icmpv6_rcv+0xc12/0x1670
> >>     ip6_protocol_deliver_rcu+0xb4a/0x1520
> >>     ip6_input_finish+0x19c/0x400
> >>     ip6_input+0xd4/0x240
> >>     ipv6_rcv+0x1fd/0x330
> >>     __netif_receive_skb_one_core+0x118/0x1c0
> >>     __netif_receive_skb+0x21/0x150
> >>     process_backlog+0x37e/0x1200
> >>     __napi_poll.constprop.0+0xa5/0x5e0
> >>     net_rx_action+0x4c0/0xf70
> >>     handle_softirqs+0x204/0x9b0
> >>     __do_softirq+0x10/0x18
> >>
> >> Make it a u8 and reject writes outside 0..31 with proc_dou8vec_minmax(=
).
> >>
> >> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> >> Cc: stable@vger.kernel.org
> >> Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>
> >> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> >> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> >> ---
> >> v2: switched to u8 and proc_dou8vec_minmax(), as suggested by Kuniyuki
> >> Iwashima.
> >> ---
> >>   include/net/netns/ipv6.h | 2 +-
> >>   net/ipv6/route.c         | 7 +++++--
> >>   2 files changed, 6 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/include/net/netns/ipv6.h b/include/net/netns/ipv6.h
> >> index ffda15318be59..aefce37c04a4f 100644
> >> --- a/include/net/netns/ipv6.h
> >> +++ b/include/net/netns/ipv6.h
> >> @@ -25,11 +25,11 @@ struct netns_sysctl_ipv6 {
> >>          int ip6_rt_gc_min_interval;
> >>          int ip6_rt_gc_timeout;
> >>          int ip6_rt_gc_interval;
> >> -       int ip6_rt_gc_elasticity;
> >>          int ip6_rt_mtu_expires;
> >>          int ip6_rt_min_advmss;
> >>          u32 multipath_hash_fields;
> >>          u8 multipath_hash_policy;
> >> +       u8 ip6_rt_gc_elasticity;
> >>
> >>          __cacheline_group_begin(sysctl_ipv6_flowlabel);
> >>          u8 flowlabel_consistency;
> >> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> >> index 94e5ef1c4f83e..abc8b811cd423 100644
> >> --- a/net/ipv6/route.c
> >> +++ b/net/ipv6/route.c
> >> @@ -6579,6 +6579,8 @@ static int ipv6_sysctl_rtcache_flush(const struc=
t ctl_table *ctl, int write,
> >>          return 0;
> >>   }
> >>
> >> +static int ip6_rt_gc_elasticity_max =3D 31;
> > as you need v3, s/int/u8/
> >
>
> Hi Kuniyuki,
>
> proc_dou8vec_minmax() put extra1/extra2 into proc_uint_conv(), which
> reads them as unsigned int, so the max has to stay an int like
> tcp_syn_retries_max and friends; a u8 there would read
> three bytes past the variable.

Ah exactly, then please use unsigned int.

Thanks
