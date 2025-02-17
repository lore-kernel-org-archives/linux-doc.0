Received: from mail-io1-f100.google.com (mail-io1-f100.google.com [209.85.166.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C07199949
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 07:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739776759; cv=none; b=bXo0IDjuPVeQLmRQlGppDtseMbl4B8W/fqf2B9kWK6pa7c6M9nTxTNziYsia0qWFfp7FQMJ5xMO1ybcOc00wggxdE8oiWjIZY0I9t88n3KsiXuZt+JwcjL/p1YI7sofPvRn9K2/OzmpgYK75k8BtATXo14ErNYY8DeDR3E4s6C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739776759; c=relaxed/simple;
	bh=9SP3e+84PPazYbiy6XBKwEpLpUqLgr7OPIfv2oglgb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rPtVs3A8DAPwlJWX5CbDkXCP7Dg50qBsz466Of4W/d7413KaSwMjxiOE8CMVd16+1fgAFTwwYhk6DNhcFo/5n8CHVM8NNVqWYYv7X6SWgWAYMIcrI/HAy7+n9VxU2fxnCgoCM8DGgJv7M0Jn9qkIO79z/vXRCRtHnemHhu4uKNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Dkd2LSDL; arc=none smtp.client-ip=209.85.166.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Dkd2LSDL"
Received: by mail-io1-f100.google.com with SMTP id ca18e2360f4ac-8559d67a0ebso5247539f.1
        for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 23:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1739776756; x=1740381556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/lIZdaULwllL9eB2jMZEZDqOXSYIw/jFwTSaiFKlq0=;
        b=Dkd2LSDLZoBCacR1JN1iYI2RuHrbhfxjU8m0mhpm3F0N4gC4MSnjWVobnwSEFzaY/L
         eCvgdAQ2Iob1DuMbKB64jIXU9GXwdcCG118ieJ9rnjVlUlV+Z+3NxHiHsCDnULyVU8Mz
         ynjqCtKZ/nmjcrsQIVHDogyp1TdH/XmBRUAvWgrVEPG6OtFD1ao3qcZX3YcXsMyP0y0n
         di5RsxYBpkmRX0/7hDGHT/PYPtH7Szx+Qm0XBSAH+nCOW84femEgeE0URIyAlCVO85k9
         0hEvyqKGzVJsyXW1z8NlBXu+bdznyT5DmfcAtDg3Lvu4t2w1qKLcMOgdbeKiYGcvbdJ5
         sdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739776756; x=1740381556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/lIZdaULwllL9eB2jMZEZDqOXSYIw/jFwTSaiFKlq0=;
        b=aUshoA9cu4x1HOy09gkHZ7Nuw6OTECKlpzbuh7hd58ZG+lLE6TA4z31vZGLWXy0MQF
         IK3EdKxhkBl0RxHEx77jUZUhOhBvBXvtCnNWb3ES+pfKxmV1WxdeqHiBGiej/1MUrhyG
         oqFv9RQ3Wy8jrfvIeXEZLU8W+h7j5s8uyZAbhBjukIqJp/zNxvq76u3bl44RXDhe7xG5
         2poaWiHYRRy4RtnbAie0+rsjDbCElaDogxxdgFls/bLtNIFm+jR8CsM7YjY79hIMGNOp
         upYVJJVmfqtuZbpb4I93ouz0pM2UdUG0+NXJ3ECUabhKK62N7pdua37MxSDzk2l8nxEf
         7XQw==
X-Forwarded-Encrypted: i=1; AJvYcCUb/zxDjeJ/YztPE7KEuNnqqilaxN8iNARvcsQ5SdELV9ZsX4eFHDyMVLxTm3A6CJagxtZ6bbF25Tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZdFpNis5SGpvPWzplIvX1MN0+qSXMNufjwYzSdPDCybK9mlWY
	WhkMtKZKmqqEU8KMCB4Q2GZ2uvz2RNe7rZvfxuqz4t5/B3OsZlEYZFtvNXnc05Vhf4AfaymH0BD
	9889Yy6z8fgx20koXu4v0zr28bPiMbcGA9OzoF3P07jj5Hyx9
X-Gm-Gg: ASbGncvPHi8ZiYxi4/k0VZ7AH5bwveJQRMSFziHsym0HgNJ/FiXDmPFHXxLfgSH/sYG
	CuIxL+lDbe8IoVNUgqxn0BxE0P4iEsL0WkUneOmTUW7NBr5ujT4U44/RxHgpVUIgy3hBP3l64ve
	9s5dCuERYwL3xCeGT3C7xT6PwjdEFYb5to77DsVX45SjB1KClcQtPbG56W6kSEwlnuMeHr+c0tK
	rJEIG/VssQ59vcDjrU2lIeodmT9gb5AwgmCdH1KwWRa6afsrG8vqbYfYBz3ALPoP+ErOUqVVgjg
	prewgQeKVt9+b7rtWQO/WzBK
X-Google-Smtp-Source: AGHT+IFmspdvwMqwmo9Ic5vcbstKN1DL+FAbVNevL9CSgdJK6lu5bk2Az58mcvHOy5eaTMPPofayKyIj+Bmv
X-Received: by 2002:a05:6602:6408:b0:855:6fa2:c324 with SMTP id ca18e2360f4ac-8557a0ce310mr872509839f.4.1739776737129;
        Sun, 16 Feb 2025 23:18:57 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-4ed282a0d77sm547484173.54.2025.02.16.23.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:18:57 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 8E1E334035D;
	Mon, 17 Feb 2025 00:18:55 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 84744E56BB7; Mon, 17 Feb 2025 00:18:55 -0700 (MST)
From: Uday Shankar <ushankar@purestorage.com>
Date: Mon, 17 Feb 2025 00:18:45 -0700
Subject: [PATCH net-next v4 2/3] net, treewide: define and use
 MAC_ADDR_STR_LEN
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-netconsole-v4-2-0c681cef71f1@purestorage.com>
References: <20250217-netconsole-v4-0-0c681cef71f1@purestorage.com>
In-Reply-To: <20250217-netconsole-v4-0-0c681cef71f1@purestorage.com>
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

