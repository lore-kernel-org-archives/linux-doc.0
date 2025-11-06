Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B550931A7F0
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762441917; cv=none; b=letMrBCltEZi7DgR5RW+0BupEt9VyQ5DMSKsLvOinECOLIMx+hW8YVY1TjGCNy4mWrx7gZi7r3KagvpdWU4QTvlD4H9n1J+Z9yg6cxRTa9T+cY6dc9wLC8S85sy0qM2T1G4IUuU+4y0XkLtmudb3gEiQTFmv0+vobBWgnCxFdxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762441917; c=relaxed/simple;
	bh=hAieD+WWGuTSffxpUcA1q/dR4SZs7rb61R1Dr5YIuDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=S/DR+TZ+4JSUbNra/Mt9+ISvbKixAjF2ziGdA0GI8U9ODhN1K8P8UdJtSqTm4Z5OKJ70EhNEXG1sDqi/knL8pXjeyxHH5J0eRXvq4aED5j/YUWsn8dselRwhdwsRIELNThII7rWnjKGh+XMkzeR9fftcnLC+sbkm1CHfucDdtm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXkxbyWh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXkxbyWh"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso1832788a12.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 07:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762441913; x=1763046713; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pr4I1+TpJGoh524IlcwOT6D1N8KANUmHgdXy9dFIgyI=;
        b=PXkxbyWheDzGXpFSxHx0NLUXMmrf6DnoSBG3msqPfLV0Y7dF1eIBp+j2Q26n/HMwJQ
         Uf0j1ykIZoWKj0D1UopoNF/K7E5SttimR3Tjo7yS9ktRQXf7WjZeN69QV4JGDIwAPNYV
         4Pv1a+1kB8UMzG0FdCaOixci51/DVW3dNFZEW4QZoExa1ZDrnSVUC88G08QqUfjvTOvp
         NvUC+CMf/2PY4gcYwr8Xesqk7d07ge3aSx6L6bL5wRvVsdKw13AwNSTJ0uT3pKmEl+A4
         vVUCJcyKidJeCpadMCwsRQO2As55hGmWh5CcG6XsplgBd+OrZVyCvkdJ9j2PjyhG+14n
         ehkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762441913; x=1763046713;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr4I1+TpJGoh524IlcwOT6D1N8KANUmHgdXy9dFIgyI=;
        b=PKs47vnthAivt2fygl+X4vaJpWckhBWH8brP9sSGDWDV4SjfKaf7RYv9l91p3ZG0r0
         K87kWq3bdqVpvboJ6col5lTuu2F/w9sVfO3E71qCwCvlN/DzFsWBP22/JqZwbEwo12hT
         wGZ2BYEt7SOHHkCNtiPf7njC2Pa/vy6Kzc7li8NqDUdsI8RI5Hk1Ie5QS1VTX9+zEQsx
         aN5m9r58m/VYFGK5/P+9v5CMtp1AWwZQMwQG5pIMRRUxfWkF0zsJl6CGwSIDJpD0AKp5
         yYXZJdw4gsjoxa1+GqU6CNr70zsDok0SXPekocW9Yw2YJmu6PIrGbtf6CFInZ99K5C2v
         5knA==
X-Forwarded-Encrypted: i=1; AJvYcCV3x/b+NZTQlbvA0oOZFZVkRglolNdKjiU7Yr95b6avO7uxA92G/bV3Pkn7sGfGTsbIMZD+H6/nVCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgNexlxplrHAhPi+WGKU2GABVod25BHXwuKcnEtUOZV8dtjivB
	BShsTlGSXL13B0pHKCC6mnqerBWRu05N82aVDAawhI5+RaLIivfiVCq3Z1gmi7Kcszw=
X-Gm-Gg: ASbGncu+/zIfQW8R6c0YcHLz09Zm2SmLET7EqUrhW5YZ/T/9xfORmu5D5n+39mVf8+e
	VKhEZ6JJGhOoKSVk8dIyQ0qOIOhxZ3Go8kuq8d4PVnewf7s0TbwDZaE3s3nK4Ujjpy3RPPR+3DY
	Sf4HDonNvHiQas22m8cYAs1atjBEwK+/T1TsUIThzWXRbyKaVKSnw7ENhczhfnkEBpirRGggImx
	yaJQLZo63g2T31erv5yOQof1qtAgoHuss7eC1OWTTSgpne4B4Bkjirg6L9EKmPW6mgDgXcZRq2o
	/NIdAbd02j9+yRIa2+qf6TOBik4z3o/0szHlrpTw8MxFFqStNCA1VFRItoP0nBn0GdtJJ9qRw2I
	zdcJYJJlv/2kaFAerIC5GP51y36SwHQZ+sn/A0PVGMfRSjrJcY52wUnl+HYH2hlzoSdlshxvbGw
	vx+mJncVRX7fdI
X-Google-Smtp-Source: AGHT+IHwC37XRyFfnN+/f5wSqrpQAP6dIioKEyvZ5pTh5YK+WFVy/VWvB0JDs0KxKTLiDxdgzCtNxQ==
X-Received: by 2002:a05:6402:1d50:b0:640:c807:6af8 with SMTP id 4fb4d7f45d1cf-64105a582f8mr7170150a12.30.1762441912914;
        Thu, 06 Nov 2025 07:11:52 -0800 (PST)
Received: from localhost ([87.213.113.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f8578ecsm2022840a12.19.2025.11.06.07.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:11:52 -0800 (PST)
Date: Thu, 6 Nov 2025 18:11:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Bobby Eshleman <bobbyeshleman@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mina Almasry <almasrymina@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v6 3/6] net: devmem: prepare for autorelease rx
 token management
Message-ID: <95223e0d-e0a4-4bff-b3a8-babe7a8a093c@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-3-ea98cf4d40b3@meta.com>

Hi Bobby,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Bobby-Eshleman/net-devmem-rename-tx_vec-to-vec-in-dmabuf-binding/20251105-092703
base:   255d75ef029f33f75fcf5015052b7302486f7ad2
patch link:    https://lore.kernel.org/r/20251104-scratch-bobbyeshleman-devmem-tcp-token-upstream-v6-3-ea98cf4d40b3%40meta.com
patch subject: [PATCH net-next v6 3/6] net: devmem: prepare for autorelease rx token management
config: openrisc-randconfig-r073-20251105 (https://download.01.org/0day-ci/archive/20251106/202511060119.MAzcsLoN-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511060119.MAzcsLoN-lkp@intel.com/

New smatch warnings:
net/core/sock.c:1107 sock_devmem_dontneed_manual_release() error: uninitialized symbol 'ret'.

vim +/ret +1107 net/core/sock.c

45aa39492cf4dd Bobby Eshleman 2025-11-04  1086  static noinline_for_stack int
45aa39492cf4dd Bobby Eshleman 2025-11-04  1087  sock_devmem_dontneed_manual_release(struct sock *sk, struct dmabuf_token *tokens,
45aa39492cf4dd Bobby Eshleman 2025-11-04  1088  				    unsigned int num_tokens)
45aa39492cf4dd Bobby Eshleman 2025-11-04  1089  {
45aa39492cf4dd Bobby Eshleman 2025-11-04  1090  	struct net_iov *niov;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1091  	unsigned int i, j;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1092  	netmem_ref netmem;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1093  	unsigned int token;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1094  	int num_frags = 0;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1095  	int ret;

ret needs to be = 0;

45aa39492cf4dd Bobby Eshleman 2025-11-04  1096  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1097  	if (!sk->sk_devmem_info.binding)
45aa39492cf4dd Bobby Eshleman 2025-11-04  1098  		return -EINVAL;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1099  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1100  	for (i = 0; i < num_tokens; i++) {
45aa39492cf4dd Bobby Eshleman 2025-11-04  1101  		for (j = 0; j < tokens[i].token_count; j++) {
45aa39492cf4dd Bobby Eshleman 2025-11-04  1102  			token = tokens[i].token_start + j;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1103  			if (token >= sk->sk_devmem_info.binding->dmabuf->size / PAGE_SIZE)
45aa39492cf4dd Bobby Eshleman 2025-11-04  1104  				break;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1105  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1106  			if (++num_frags > MAX_DONTNEED_FRAGS)
45aa39492cf4dd Bobby Eshleman 2025-11-04 @1107  				return ret;

Uninitialized.  It's always a good idea to test code with
CONFIG_INIT_STACK_ALL_PATTERN.

45aa39492cf4dd Bobby Eshleman 2025-11-04  1108  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1109  			niov = sk->sk_devmem_info.binding->vec[token];
45aa39492cf4dd Bobby Eshleman 2025-11-04  1110  			if (atomic_dec_and_test(&niov->uref)) {
45aa39492cf4dd Bobby Eshleman 2025-11-04  1111  				netmem = net_iov_to_netmem(niov);
45aa39492cf4dd Bobby Eshleman 2025-11-04  1112  				WARN_ON_ONCE(!napi_pp_put_page(netmem));
45aa39492cf4dd Bobby Eshleman 2025-11-04  1113  			}
45aa39492cf4dd Bobby Eshleman 2025-11-04  1114  			ret++;

Uninitialized.

45aa39492cf4dd Bobby Eshleman 2025-11-04  1115  		}
45aa39492cf4dd Bobby Eshleman 2025-11-04  1116  	}
45aa39492cf4dd Bobby Eshleman 2025-11-04  1117  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1118  	atomic_sub(ret, &sk->sk_devmem_info.outstanding_urefs);
45aa39492cf4dd Bobby Eshleman 2025-11-04  1119  
45aa39492cf4dd Bobby Eshleman 2025-11-04  1120  	return ret;
45aa39492cf4dd Bobby Eshleman 2025-11-04  1121  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

