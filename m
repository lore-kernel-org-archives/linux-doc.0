Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049C53597E
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 01:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740101374; cv=none; b=NuI//LNROO7UA2uP9bv62u1xCTSISMk8zqKguz2dZneSVKWCOelmPav/DutHWRmFwAMorXTTdvcyH7x+nLw1I8nukoYPEEAuTLpKSOHokDTHaTPTRNbW4YuQMuBiLrNwwlNnLCv72Pf/jJfk3fQb7gRVvOelRQDC6qMM6uoKuOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740101374; c=relaxed/simple;
	bh=9SP3e+84PPazYbiy6XBKwEpLpUqLgr7OPIfv2oglgb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o7hVjOslz0FhW/DDTIfgPO3RZJirccU2v8N28hz5LY33jwEj+wjRAg/lCVK7Wgeu7913xJOh5n7mj1CHc1Xk92g7nrasV+ZHyVEvgv5ajDbQFjRvffy3eoSs39wFf5xRJdHoAj88UF1rVVmSjVcP2M8a2f5mUnhxl2mi4BPA7/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=N58/eRhl; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="N58/eRhl"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-220f4dd756eso31601855ad.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 17:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1740101370; x=1740706170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/lIZdaULwllL9eB2jMZEZDqOXSYIw/jFwTSaiFKlq0=;
        b=N58/eRhlA95SFbhUtI4jrqG0wEuR8kizY/9203DePdaHWU/Y7+zoElMpYlZGposLxY
         LTPa5QPfwKGIhDYujjDNvGo+0+qQDR+sKvVPdOEFSaIs3Mrlg1H1qqUfoerSHpS7+gTU
         BA7hy7EBZhjuTNrL6HjPg+fbwb0ikxmzdFV5mNnSc5d0KinL2hFMnSQPJP134PyRLlRD
         ReerlUwoLYuYLdWlmmHIim4psSDZZRdH/TIWocslSdaN/VfuX+ZIrj+r8fioa7gQOjNU
         R2m+BsOF4oTgg2ri7RCAdb3rf1X1DjHB017wck/VJrj/hiottfaYaoKiWeKXuN8H5qtY
         cBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740101370; x=1740706170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/lIZdaULwllL9eB2jMZEZDqOXSYIw/jFwTSaiFKlq0=;
        b=kh7GV9orKO053299rYMNfoTCL9C6BQ0nvnieOHrvwKqIuQWOk4mhlePh/xNj1EFtuW
         WmuWrXEAwRPAl7HjaUAKYOmYeJCL53f9Fqb6tfJQef/DxSMKzAe29T1QpfDbANX+MHO2
         dLnA9pzl+MSzO1o47AKTPvCZR/5VsPbvwf/zvaRu20vESV8Dct+yNlEGqbLCmg4QnGIS
         Bnhf0uVz3ynDUKVnj2BEof29Kk6a/sUdKP9MbNC2/h9K+wPfzJybGjl8lZK9d8aisxD8
         uTuzkUDPmNzzgW2pnu43E9YYFAfujorHmSrU0RAV1zbg6Gg6t2Ff8vPHxKMIF5DHc8YA
         1ebg==
X-Forwarded-Encrypted: i=1; AJvYcCVGMuME+UDLmV4qw5wNAq2a+R13IJUqkwmKB+B+EmvzWSVgtLSmeCYxSWGBYg6LuADXxmDU49b5Qkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOdGexvtLqrYmk/GbV1d1WAXW1pPY6nlEwaiG/wyUTxddeH6oD
	V/6C8545ws1jxDZQOi865dVF7HC/QcTH8ZIPZsLhqTpqPKOOhB07bncW8DB05ZDwkucNb0ILn+I
	eMeqeXp205OFkv7NkQnA6iJKcuWWebZ212GTQfka8e9pjYvqX
X-Gm-Gg: ASbGncswSLj1U9Wa5zcs4RnBt150gvN+YlNKYrU+GwxD0/4cIKtu2JSFDBUXFqIvwVw
	edgquy+ImsASKNVEUqqdGhS0kpt3LjjCwgoaH4H+9PhDdzT2ZFesG4BRUX7NcKzr5WEsOyA1Epv
	VrLGTHqv4QEFrzlqDp0S4Hc9w0Otm6GbTG8SS2pctAZv7PMevny+dZgI4i0e6rfDiKPP9up09jV
	osYjN6yvS/Vdfwjt0T3Eo8n2j9U3rdRWPjpqiiYv9oPcKqn33NOyzdyCfQ5t+x4kKMksBuIIfGf
	i+60OpnVqaqiNl7zFjwRn6W8By4kCzJKW4U=
X-Google-Smtp-Source: AGHT+IFkO1QaCMM8FzZGFc/aMhDBHc49ZvWNnIurWZplo4qOW5YgaFO2kL5rf+A4qtwlUV3nqHfnErN+UuTS
X-Received: by 2002:a05:6a20:72a3:b0:1ee:d6a7:e341 with SMTP id adf61e73a8af0-1eef3d6cdc7mr2792518637.30.1740101370254;
        Thu, 20 Feb 2025 17:29:30 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-73267fc45c8sm909389b3a.11.2025.02.20.17.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 17:29:30 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 85D9B3405CE;
	Thu, 20 Feb 2025 18:29:29 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 758C9E402F2; Thu, 20 Feb 2025 18:29:29 -0700 (MST)
From: Uday Shankar <ushankar@purestorage.com>
Date: Thu, 20 Feb 2025 18:29:20 -0700
Subject: [PATCH net-next v5 1/2] net, treewide: define and use
 MAC_ADDR_STR_LEN
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-netconsole-v5-1-4aeafa71debf@purestorage.com>
References: <20250220-netconsole-v5-0-4aeafa71debf@purestorage.com>
In-Reply-To: <20250220-netconsole-v5-0-4aeafa71debf@purestorage.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Simon Horman <horms@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-wireless@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>, 
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
X-Mailer: b4 0.14.2

There are a few places in the tree which compute the length of the
string representation of a MAC address as 3 * ETH_ALEN - 1. Define a
constant for this and use it where relevant. No functionality changes
are expected.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
Reviewed-by: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Acked-by: Johannes Berg <johannes@sipsolutions.net>
---
 drivers/net/netconsole.c           | 2 +-
 drivers/nvmem/brcm_nvram.c         | 2 +-
 drivers/nvmem/layouts/u-boot-env.c | 2 +-
 include/linux/if_ether.h           | 3 +++
 lib/net_utils.c                    | 4 +---
 net/mac80211/debugfs_sta.c         | 7 ++++---
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index f77eddf221850fe2778cd479e49c91ad695aba3c..12699831e3c9fdbafd4862a339aea4ef04cf522b 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -721,7 +721,7 @@ static ssize_t remote_mac_store(struct config_item *item, const char *buf,
 
 	if (!mac_pton(buf, remote_mac))
 		goto out_unlock;
-	if (buf[3 * ETH_ALEN - 1] && buf[3 * ETH_ALEN - 1] != '\n')
+	if (buf[MAC_ADDR_STR_LEN] && buf[MAC_ADDR_STR_LEN] != '\n')
 		goto out_unlock;
 	memcpy(nt->np.remote_mac, remote_mac, ETH_ALEN);
 
diff --git a/drivers/nvmem/brcm_nvram.c b/drivers/nvmem/brcm_nvram.c
index b810df727b446b1762a1851750f743e0de6e8788..b4cf245fb2467d281111001bb7ed8db5993a09b2 100644
--- a/drivers/nvmem/brcm_nvram.c
+++ b/drivers/nvmem/brcm_nvram.c
@@ -100,7 +100,7 @@ static int brcm_nvram_read_post_process_macaddr(void *context, const char *id, i
 {
 	u8 mac[ETH_ALEN];
 
-	if (bytes != 3 * ETH_ALEN - 1)
+	if (bytes != MAC_ADDR_STR_LEN)
 		return -EINVAL;
 
 	if (!mac_pton(buf, mac))
diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
index 731e6f4f12b2bf28e4547d128954a095545ad461..436426d4e8f910b51b92f88acddfbb40d374587a 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -37,7 +37,7 @@ static int u_boot_env_read_post_process_ethaddr(void *context, const char *id, i
 {
 	u8 mac[ETH_ALEN];
 
-	if (bytes != 3 * ETH_ALEN - 1)
+	if (bytes != MAC_ADDR_STR_LEN)
 		return -EINVAL;
 
 	if (!mac_pton(buf, mac))
diff --git a/include/linux/if_ether.h b/include/linux/if_ether.h
index 8a9792a6427ad9cf58b50c79cbfe185615800dcb..61b7335aa037c7232a0caa45572043057c02dde3 100644
--- a/include/linux/if_ether.h
+++ b/include/linux/if_ether.h
@@ -19,6 +19,9 @@
 #include <linux/skbuff.h>
 #include <uapi/linux/if_ether.h>
 
+/* XX:XX:XX:XX:XX:XX */
+#define MAC_ADDR_STR_LEN (3 * ETH_ALEN - 1)
+
 static inline struct ethhdr *eth_hdr(const struct sk_buff *skb)
 {
 	return (struct ethhdr *)skb_mac_header(skb);
diff --git a/lib/net_utils.c b/lib/net_utils.c
index 42bb0473fb22f977409f7a6792bb1340f4e911c3..215cda672fee1b5a029c2b61529c6813c0edab11 100644
--- a/lib/net_utils.c
+++ b/lib/net_utils.c
@@ -7,11 +7,9 @@
 
 bool mac_pton(const char *s, u8 *mac)
 {
-	size_t maxlen = 3 * ETH_ALEN - 1;
 	int i;
 
-	/* XX:XX:XX:XX:XX:XX */
-	if (strnlen(s, maxlen) < maxlen)
+	if (strnlen(s, MAC_ADDR_STR_LEN) < MAC_ADDR_STR_LEN)
 		return false;
 
 	/* Don't dirty result unless string is valid MAC. */
diff --git a/net/mac80211/debugfs_sta.c b/net/mac80211/debugfs_sta.c
index a67a9d3160086ac492d77092a0c8a74d2384b28c..a8948f4d983e5edee45d90ad267582657ed38e38 100644
--- a/net/mac80211/debugfs_sta.c
+++ b/net/mac80211/debugfs_sta.c
@@ -457,11 +457,12 @@ static ssize_t link_sta_addr_read(struct file *file, char __user *userbuf,
 				  size_t count, loff_t *ppos)
 {
 	struct link_sta_info *link_sta = file->private_data;
-	u8 mac[3 * ETH_ALEN + 1];
+	u8 mac[MAC_ADDR_STR_LEN + 2];
 
 	snprintf(mac, sizeof(mac), "%pM\n", link_sta->pub->addr);
 
-	return simple_read_from_buffer(userbuf, count, ppos, mac, 3 * ETH_ALEN);
+	return simple_read_from_buffer(userbuf, count, ppos, mac,
+				       MAC_ADDR_STR_LEN + 1);
 }
 
 LINK_STA_OPS(addr);
@@ -1240,7 +1241,7 @@ void ieee80211_sta_debugfs_add(struct sta_info *sta)
 	struct ieee80211_local *local = sta->local;
 	struct ieee80211_sub_if_data *sdata = sta->sdata;
 	struct dentry *stations_dir = sta->sdata->debugfs.subdir_stations;
-	u8 mac[3*ETH_ALEN];
+	u8 mac[MAC_ADDR_STR_LEN + 1];
 
 	if (!stations_dir)
 		return;

-- 
2.34.1

