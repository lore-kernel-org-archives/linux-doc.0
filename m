Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACE323AB9D
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 13:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780235329; cv=none; b=g4jQpOyVvm583RAhc3JxGe5c+WwHvfpQ3owAB0JzvPuVJJqL7sGSJb31/fr+xRAYI6IpKNJ3nC54xojk/c4JZTVYSqDZPMqpqOuiVdvPISo1MUPO180eR9HLdFFYPSBh1D8ps2KZlTQ/1O47+tvujNzcAnjgRKcz8tu7Ty8Nrsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780235329; c=relaxed/simple;
	bh=b3FOszVHkVm8U2qHIemMz8yWcVhXu0hqK5FQeA6pLFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cd9UQ2Fvl+jU7apkljiGuQXFvHIusIG2BE1pAqyiML0ky7y2Ff/rTQvuPrZXwlN+IjxIAD10X2nmWcyoMLJ69xTmdv37QORHWUssujUATs1rVgS/EjmLO+j28iM3ZKOiHNHFRxbNlFbMgeWP7f0Pno0MGY33VpFerMbnhYul96I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hlOlmu+I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JT3PYXI9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hlOlmu+I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JT3PYXI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780235327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NvsWgm5Zh3KY7uwAkRP+5UVl3cDUtJxbowpLE3/21Nk=;
	b=hlOlmu+Idme+M/JicBbHPg6XWthF9yq0yo/Es36QH1yKDehX4iodaPvtTVsTutTMfUr+3o
	3+CBPAv6L1NVItoYlnYy18vXA8oud3TvKkJ+uHKXi81WAxg5pZ9pIPavN7SjrZYOHnSPZO
	CRYkcZwgo68dURrVJC69iYJg5BTNV6U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-LNANQoj_PdmPrfDLs_jzig-1; Sun, 31 May 2026 09:48:45 -0400
X-MC-Unique: LNANQoj_PdmPrfDLs_jzig-1
X-Mimecast-MFC-AGG-ID: LNANQoj_PdmPrfDLs_jzig_1780235324
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-45efa2f7009so594269f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 06:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780235324; x=1780840124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NvsWgm5Zh3KY7uwAkRP+5UVl3cDUtJxbowpLE3/21Nk=;
        b=JT3PYXI9qm40ZaLWWB7cogXvHv7uLWABv7lTaVAIkkmEiCZ+HI4AFSt216lbC1M6pY
         872M+/T3OF3OXAA+0tpkaEs2Q7nlzAd2PDH7VXzrwhf30ZNVvaHxOt2+b894kbFtq+Id
         OKnCiC0Esbjn62SrXi6Syjm+EQYYEKWK2VSsaaZzeQ0GmNDr4gGn/P/0MdXqJ3zCWL4/
         edsARB2v2dlaBkZ2hO5sJil7UcYw4q8REi9vs3PfNpr/5RoCdzsS8LKzrdc2dxJE/aFA
         6kiCVmcky9HLsHPl9Y2elkbkh/0x0ZY7g2BNWsV8LI/+6FaUcJ850VH1X2aG2Jidqg8K
         qMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780235324; x=1780840124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvsWgm5Zh3KY7uwAkRP+5UVl3cDUtJxbowpLE3/21Nk=;
        b=olSMjXMd3gYlBXpKeliYGxXS3I9NH/HmpnVrDBqB+O9cWruym60j67TDPOp3udbAgi
         IYf9VxmcmssY2gf+Y+8DwJwY2PPS4bqyMHtlt2fPETpZ13RPYS39lFhPu63Pc3hepCgL
         34bq7kizcoOJXXqyHjIk8LrvflJ/S3uhKEvYnBRGwqv98s95xVl0NDvtlA1PS3CMJsHp
         N5e1Otd5SmACERgBK6n8fNqJOduCRe1fzzOaWNaf+PuRSEyjmsoO597ErGD/wOWt+gcE
         PEJwz9P14lXjadvZYC5tVrhgTQq+0nfyk3FjYvbDedGSWncjM8d1BsZcgjXkXqWH4blj
         gRXw==
X-Forwarded-Encrypted: i=1; AFNElJ+0NNzQtg0Q+lD+E3+Q4IDK5T3lki7iSuwNe8i06l2xT/adnd7HdNrJ9H92hN0Kim6uYVSNIdKOnpk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3sA96cr4RwIQWc7Ri3Er5EbEyaMIl+GO9Ppg6rzhP0Caypkf8
	S6YCjmKEdRp9OKepGyCpLSwR6iNQeOT0jayjx7tzzqaNNZlFcenPEmTnJGBKmiMIyFyZoZo5HRv
	eyRW0ZB81zMpsUmpcmlm42bust6pUy1k70R07Zwjsp8ZBAGJn0N8Jk3XPh8kHLA==
X-Gm-Gg: Acq92OE5e1EeBi+yFWExod+olkcG3Mr7uwXik148b5003pfcUfiS/mSXMDUxb1adMUX
	Ze2olJENO5cmwq9VrZI9zxT545Nq5ZWv38ESc7QyXdNgCPqXxelnYp/L+rFeLHGn5dFdljymb3Z
	aNZwtuePxUetDa8E1gOKUm3gLMDmt2K42PB8FjSHKm7qnqyA7y/uTHLfzynuyuFEm1R5K4UVaOW
	tI30/0uKj8fMBQ/w2lUcPzJ+0ngZIFPItqKMyCGWndR6o/B2gRbGkWPhW5erdT49x8jijWi4C/z
	MZD0eegBmX9XwSHTTC9bSe256Wsa7Btdi6EPrViBaWzM+ZeWoM8uw+2ufPO3abxxWLGgNG4cNaQ
	gtSnGRC7mqb1No+0MovsccrfTOHCd3e7T9VXML2qkc+u+JA==
X-Received: by 2002:a05:6000:4b02:b0:45f:1bd:a053 with SMTP id ffacd0b85a97d-45f01bda1famr9554781f8f.1.1780235324334;
        Sun, 31 May 2026 06:48:44 -0700 (PDT)
X-Received: by 2002:a05:6000:4b02:b0:45f:1bd:a053 with SMTP id ffacd0b85a97d-45f01bda1famr9554745f8f.1.1780235323939;
        Sun, 31 May 2026 06:48:43 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm17549086f8f.3.2026.05.31.06.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 06:48:43 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] net: Remove orphaned ax25_ptr references
Date: Sun, 31 May 2026 16:48:36 +0300
Message-ID: <20260531134837.4111349-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AX.25 subsystem was removed in commit dd8d4bc28ad7
("net: remove ax25 and amateur radio (hamradio) subsystem"),
which removed the ax25_ptr field from struct net_device but
left behind the kdoc comment and documentation.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/networking/net_cachelines/net_device.rst | 1 -
 include/linux/netdevice.h                              | 1 -
 2 files changed, 2 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 7b3392553fd6..eb2e6851c6f6 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -91,7 +91,6 @@ struct vlan_info*                   vlan_info
 struct dsa_port*                    dsa_ptr
 struct tipc_bearer*                 tipc_ptr
 void*                               atalk_ptr
-void*                               ax25_ptr
 struct wireless_dev*                ieee80211_ptr
 struct wpan_dev*                    ieee802154_ptr
 struct mpls_dev*                    mpls_ptr
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index beed64b8d93f..460350a7f77a 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1947,7 +1947,6 @@ enum netdev_reg_state {
  *	@atalk_ptr:	AppleTalk link
  *	@ip_ptr:	IPv4 specific data
  *	@ip6_ptr:	IPv6 specific data
- *	@ax25_ptr:	AX.25 specific data
  *	@ieee80211_ptr:	IEEE 802.11 specific data, assign before registering
  *	@ieee802154_ptr: IEEE 802.15.4 low-rate Wireless Personal Area Network
  *			 device struct
-- 
2.53.0

