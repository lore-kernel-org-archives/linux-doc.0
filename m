Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F0140F8C7
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275744; cv=none; b=m9ggN5hq/3Hx1OydSmGTbI5EBaEacm/hznNYg4Q1PdrWo+DFWMNJEWhR1gC18Vd6wT8r49+Yy3qdWiqb51KtWjAYdzQ6uK2MSsb/oLLfuErtLCqZMhquTRkkGB6HAD+pGh60GPRNlQIMRzyj9ogqijC9xbDhmPpW+zEFF4G6f3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275744; c=relaxed/simple;
	bh=lm4ZsFpNUgwpK3YnX3D6FcdAELUM2A+q69wdbtD9hng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnoz7nn0qb8CVU+1uygdchmYls0p2BRa3Z0HQy9aYNNQAquTAU5sGFhV+0PAMyfFzF+1oP7vO24DriO3vuFbA0p+3+8kKd5C10PVsS1YSn0g6KHW7m97JqPh598Bswc7729yS2kv7kDsrnEp3H0oIAlLSqHwW7eXhFknNvgFPnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB1NAApR; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB1NAApR"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8eae9229110so317330885a.1
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778275742; x=1778880542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/LAF18jiWTLJl8Jwx6HS2JQdllgi/a4OQyHfJwaQg84=;
        b=dB1NAApRVCzA/GJ3Zsj63KroNB3QF16jAEzm+2Y5Z4Jd6dJRojdXOImqLa5jsJ03kR
         oM/vSwYadVwGRFXbPLOt3JG+qV+ygFOV00YT6B5e4Fu20iTuJdcv+qvm9D7yn4TZQDzo
         3lsUguU7SvDpNkkDK6cKzT4c2pYtv9rVlqvRF6OZqJP7pbuNfdoMwpAq4czB6xxAHT8H
         917O/5/cvnid69CWTYlJ3+TNduUJxqIpCx1HHiigYYR7S3fEbAcwboEx8qCQ6cT0KwYY
         6k8wF0lJVBkEO+2gBk7UV/0ivXlmvaqhu3wlQhVuzHjXvPqeqhbkQN89BOg7fu3pW1kN
         bUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275742; x=1778880542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LAF18jiWTLJl8Jwx6HS2JQdllgi/a4OQyHfJwaQg84=;
        b=mnZ4u1XkIZqvdv4tq55SoaD58x5Zo+WRjag61PxqAaV4j8iEnlCWnfXBpdLK3OWO/x
         A0jiJzhgf0LSd7TavPv4Hw9AuMwU9Ji+Pzx9j2gjGvtaUFOSB7zsBbwkhZl4N0N3IYfo
         TaZhciu1aHm+U7SHAnIxpCkoqTXluxtlhMlk8fQHlP3RY7m2Kvp/nCXjnaBzN9MZGbaj
         RUuejsij4cTDkKnjPcoplLHaSjwbchXZwYqg3+H/WLxz8Gqf8QAbXNDFAcCM1nim8fhY
         Nzg07uc14GYvgT89qMRbynH8U1YYDm7q6I2+Gh0ivx35J7wRXGIUHu5AiIXuMKt395BW
         4KKg==
X-Forwarded-Encrypted: i=1; AFNElJ+JX5s1hwFxC2yKqZqMh7UkgRl8SMH27DktP0xjS28GLU1SnFPYlhDbiAJlu4Tma8FFC30DzT2DNuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhvTeu/eQrHsEMmAEfauOFSpMqBQtiaAfHCWa/hs3wh/aeylHn
	owRLW9HaRGlyDFoOisrhmgZtyzz9uTNL0HdCBUR2MAy9c5edl0iPR+H9
X-Gm-Gg: AeBDiet8YxLMHlfT1YBwbDWVyVWZjG1kwf1MnEQIRV87GIVjnEkXdT0/QQnMW0wOg5R
	n1ve4rjU5airo4/y+20diMdhOhHqqcCk5krzN88SZmv+5+CQ6qlhfJcA7vp3Fp1JQAYdwuiofyV
	z6pSzVkP7UuiRVaLqelvCbmHesrqANgLh5AsoMvkdNiQZL1/0+mUbbHXRaEC0llY8Nu95dnXKlR
	OQblXdEOojgNbQp8/YV71GfP8pOCDWP7KTxYppOCcDw9vHDRfJtiNud8jnppLD/okp0XD2WUPPY
	UXrFIhBCmRQxPZTYLgANT9dVQXeM6kcQYQErMvdr9522aL+uhgrFuRlehYz2IWIio7uKDCxYGtH
	Ya5xmRWjJiM7TVOlHSqAbvP/X+fIXQKZSK/GYEzsXMjYuw7iziHHbsm4+R+Jsw+3AePvsdRRvun
	WOvfoJActl4G5L+8u7cXBJc/jAPDTkRdhqCAD/qcAdBNr1j1npMN2JQuuZcu/kASk8gFg=
X-Received: by 2002:a05:620a:40d0:b0:8dd:b4fc:d561 with SMTP id af79cd13be357-904d438db5dmr2198955585a.10.1778275741832;
        Fri, 08 May 2026 14:29:01 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:f800:1::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2cd057acsm2596938185a.47.2026.05.08.14.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:29:01 -0700 (PDT)
Date: Fri, 8 May 2026 14:28:55 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com,
	Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, dw@davidwei.uk, sdf.kernel@gmail.com,
	mohsin.bashr@gmail.com, willemb@google.com, jiang.kun2@zte.com.cn,
	xu.xin16@zte.com.cn, wang.yaxin@zte.com.cn, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 3/8] net: devmem: support TX over
 NETMEM_TX_NO_DMA devices
Message-ID: <af5Vlwb5RctHym8D@devvm29614.prn0.facebook.com>
References: <20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com>
 <20260507-tcp-dm-netkit-v3-3-52821445867c@meta.com>
 <20260508134717.4ef87ab6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508134717.4ef87ab6@kernel.org>

On Fri, May 08, 2026 at 01:47:17PM -0700, Jakub Kicinski wrote:
> On Thu, 07 May 2026 19:27:48 -0700 Bobby Eshleman wrote:
> > +	/* Virtual device (e.g. netkit) the user called bind-tx on. Must be
> > +	 * NETMEM_TX_NO_DMA.
> > +	 */
> > +	struct net_device *vdev;
> 
> AI keeps complaining that we don't hold a reference to this dev which 
> I think is fine, we're just comparing pointers. Could we maybe make this
> a void pointer and mention in the comment that we treat it as "best
> effort cookie" (better phrasing welcome).
> 
> Or we should wipe these vdev pointers when vdevs disappear, not sure
> how hard that'd be (or whether it's worth the extra state).

My guess is this would probably be the simplest way?

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 644c286b778f..e28fae14c687 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -533,3 +533,38 @@ static const struct memory_provider_ops dmabuf_devmem_ops = {
 	.nl_fill		= mp_dmabuf_devmem_nl_fill,
 	.uninstall		= mp_dmabuf_devmem_uninstall,
 };
+
+static int net_devmem_netdev_event(struct notifier_block *nb,
+				   unsigned long event, void *ptr)
+{
+	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
+	struct net_devmem_dmabuf_binding *binding;
+	unsigned long id;
+
+	if (event != NETDEV_UNREGISTER)
+		return NOTIFY_DONE;
+
+	xa_for_each(&net_devmem_dmabuf_bindings, id, binding) {
+		if (!net_devmem_dmabuf_binding_get(binding))
+			continue;
+		mutex_lock(&binding->lock);
+		if (READ_ONCE(binding->vdev) == dev) {
+			ASSERT_EXCLUSIVE_WRITER(binding->vdev);
+			WRITE_ONCE(binding->vdev, NULL);
+		}
+		mutex_unlock(&binding->lock);
+		net_devmem_dmabuf_binding_put(binding);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block net_devmem_netdev_nb = {
+	.notifier_call = net_devmem_netdev_event,
+};
+
+static int __init net_devmem_init(void)
+{
+	return register_netdevice_notifier(&net_devmem_netdev_nb);
+}
+subsys_initcall(net_devmem_init);


I'm open to either approach. The void* + comment is good too, IMHO.  For
the notifier, I'd probably want to add a test too ensure sendmsg() kicks
back after the device is removed.

Best,
Bobby
