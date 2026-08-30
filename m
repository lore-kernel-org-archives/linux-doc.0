Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC96435CB8C
	for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 23:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788132176; cv=none; b=dzgZQduMgBAM2BURLzOhJ88cfDQ+bMqUbU+rTajUHN72ojJ4MxIKJBAD+4D9hwVR+dahfPdsQLeqREJI83MW85JeyyZBekFZQFZ4w/dRNmPZCGa+d5h5n0pCitADr0yuMaWiTOEpC/Gx4eEKIxWl3qYXXYAhAWaAvNuDAlXPj9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788132176; c=relaxed/simple;
	bh=DVj+WxYMaH7xErgtRURdPZIYrygxVAeE8S+6pSHRAj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPSf1sXiMOsHa/xWWcKw1WL6Qg7FLJaEDoNs6NGczkqHxnRIR09zhZ9mDa8WT5sSyUysuP2we+EQV/dV84NpAAApsnhaJ0x2Ns4wJZOBgtduy4RSbzkmIARjUwgn+iNpGEHl5yzeRvACiykhqSwp1CMILFN/G5r+2coF5i5ilK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTeZw+Nq; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTeZw+Nq"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-861a2ae9c51so2601157b3.0
        for <linux-doc@vger.kernel.org>; Sun, 30 Aug 2026 16:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788132173; x=1788736973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGMddz4oxHyMD/VYwjKLQUQ8UAQjzIFIQ1x/LerDgfU=;
        b=FTeZw+Nq2KYYn97EkC+fvhK/53kMym6WJ2hnmDeYhVn/O0fl3gGUgn6XR6pBvalh2Y
         907JT5ZBb82HlYC5966Htpz8rPLzR/NkNY7csNsWTc6ojeZPFDqLIPHq8TfrfbDRtEym
         CVMAxhTQLzrCapOL47Vc5Y6A9+nRSAqQaVkYqkd/iTMj/rmE8wehDX68e5miOkeDP/2h
         joZNc93JJ3kXemRwFWwjekG3EMxSTGBA4t4BK1i8UKKqyuELgbbie1Yhz2cOnKYEreCM
         9qUYbSZm6ymyLhnPhVnMe8cGNt8RxoBS5GpQY9QE1Yi852Xug5JUdqpzl0rgBWEG2b9G
         5ErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788132173; x=1788736973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGMddz4oxHyMD/VYwjKLQUQ8UAQjzIFIQ1x/LerDgfU=;
        b=pvJQQxDT9z2bybh5cD2mHesEWG5beJPaoCOb0OvuYlynJ7u41DtPrcrA3UVjAwMnMP
         +KKiS8HmgxHMMCt5j10wXz9PEqDb8He3uPyQoXD5v6UoF9d0gULM7qV8H0yZAqijRV9J
         jYZC13Aq/Jby+VXgcbFWZjvdV7y82ZP1lDBtBbsKBF6J8Q9tZEYJaSxzEIpknG8poEz6
         GjtsIVDkg/1zgDiobDliVDa7YVODX58JAv+0IIbWzxOzsK9cA2nYTThpVhIx1hb1Yql2
         LP34KCb7W2o4e6JQKKa9sJn9H+AktlfN2ZaV2BV2uM46r2ci/kyDybQKZ1o8scM6WAsB
         8r4A==
X-Forwarded-Encrypted: i=1; AKwUvBzWNtlIUjHRorSK+cx4spwQ6zSLb3i/pdCf01w8mVvzqegLXsPIHi2bPrb6B25lmAUQe92RLzwXqtI=@vger.kernel.org
X-Gm-Message-State: AFuF++kTXp4OmcMEHG3zyahDyB3PvZV0sNDfs2vSoA0fgu0eLoHQ90am
	4nEk82n970GS4uWiWRDXtOd3fZEUtWhk+c1dG06RTlX2kgRDJBYRUMOV
X-Gm-Gg: AYBFou2QlgqnkrPMrBfFjZqrl9ApkCdTH7h4B6p8rRnM2hjiN6cJREnp28xbL+/yB2/
	PTWGJ4pUzeD6uJYIGgLDAu8OElTFUb9TTMaeO+anheINIO5hvvfJLHZTfIEABWk6kd0wcKHGwKv
	eSYltvuTKfMTMGGaeX7Bp4haERSL/k1WpVjqbMM1eA8j+5Me6tFiFLq3HQrh1TKkDwqlD/7RQ/r
	0esHBlefSnhZq+YV4HDmeZ1+X5/CniyN7UraBwH+8ktq276MD6AxM+0kTtTyl9rbQ9rbm0E3cyj
	kI57cSoh+ZwQNSfAE7RKZCOqiXQRFFRDUlCYNPkkE3TmBYQI2jERz4Y36RTVAIDWe9wsU/0SW+s
	eWAnM5Kf4f40FC5+E63S2axRBVf0ja+LsIwK8zA0RL6JRQHRvwTyb4bKA9Gct12OmhHM49oqzrE
	x+d0ssBjE8Nk8G++7RlAyWu8wQ9sEKJCQS6fqn5OSs
X-Received: by 2002:a05:690c:e15c:20b0:81d:e7d2:a46d with SMTP id 00721157ae682-85d65ee90b5mr61045247b3.5.1788132173517;
        Sun, 30 Aug 2026 16:22:53 -0700 (PDT)
Received: from devobuntu.lan ([2600:6c5c:6b00:316::23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e677606aesm39025937b3.45.2026.08.30.16.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 16:22:53 -0700 (PDT)
From: Matt Vollrath <tactii@gmail.com>
To: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Vollrath <tactii@gmail.com>
Subject: [PATCH iwl-next 8/8] e1000e: return skbs to NAPI cache
Date: Sun, 30 Aug 2026 19:21:46 -0400
Message-ID: <20260830232146.36948-9-tactii@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830232146.36948-1-tactii@gmail.com>
References: <20260830232146.36948-1-tactii@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use napi_consume_skb to hand skbs back to the NAPI cache. This closes
the loop with changes to the Rx path.

Signed-off-by: Matt Vollrath <tactii@gmail.com>
Assisted-by: Claude:claude-5-fable
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index c906175ad38d..a28ee0750f4b 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -713,7 +713,7 @@ static struct sk_buff *e1000_build_rx_skb(const struct libeth_fqe *fqe,
 
 static void e1000_put_txbuf(struct e1000_ring *tx_ring,
 			    struct e1000_buffer *buffer_info,
-			    bool drop)
+			    bool drop, int budget)
 {
 	struct e1000_adapter *adapter = tx_ring->adapter;
 
@@ -730,7 +730,7 @@ static void e1000_put_txbuf(struct e1000_ring *tx_ring,
 		if (drop)
 			dev_kfree_skb_any(buffer_info->skb);
 		else
-			dev_consume_skb_any(buffer_info->skb);
+			napi_consume_skb(buffer_info->skb, budget);
 		buffer_info->skb = NULL;
 	}
 	buffer_info->time_stamp = 0;
@@ -860,11 +860,12 @@ static void e1000e_tx_hwtstamp_work(struct work_struct *work)
 /**
  * e1000_clean_tx_irq - Reclaim resources after transmit completes
  * @tx_ring: Tx descriptor ring
+ * @napi_budget: NAPI polling budget, or 0 when called outside NAPI context
  *
  * the return value indicates whether actual cleaning was done, there
  * is no guarantee that everything was cleaned
  **/
-static bool e1000_clean_tx_irq(struct e1000_ring *tx_ring)
+static bool e1000_clean_tx_irq(struct e1000_ring *tx_ring, int napi_budget)
 {
 	struct e1000_adapter *adapter = tx_ring->adapter;
 	struct net_device *netdev = adapter->netdev;
@@ -899,7 +900,8 @@ static bool e1000_clean_tx_irq(struct e1000_ring *tx_ring)
 				}
 			}
 
-			e1000_put_txbuf(tx_ring, buffer_info, false);
+			e1000_put_txbuf(tx_ring, buffer_info, false,
+					napi_budget);
 			tx_desc->upper.data = 0;
 
 			i++;
@@ -1340,7 +1342,7 @@ static irqreturn_t e1000_intr_msix_tx(int __always_unused irq, void *data)
 	adapter->total_tx_bytes = 0;
 	adapter->total_tx_packets = 0;
 
-	if (!e1000_clean_tx_irq(tx_ring))
+	if (!e1000_clean_tx_irq(tx_ring, 0))
 		/* Ring was not completely cleaned, so fire another interrupt */
 		ew32(ICS, tx_ring->ims_val);
 
@@ -1816,7 +1818,7 @@ static void e1000_clean_tx_ring(struct e1000_ring *tx_ring)
 
 	for (i = 0; i < tx_ring->count; i++) {
 		buffer_info = &tx_ring->buffer_info[i];
-		e1000_put_txbuf(tx_ring, buffer_info, false);
+		e1000_put_txbuf(tx_ring, buffer_info, false, 0);
 	}
 
 	netdev_reset_queue(adapter->netdev);
@@ -2060,7 +2062,7 @@ static int e1000e_poll(struct napi_struct *napi, int budget)
 
 	if (!adapter->msix_entries ||
 	    (adapter->rx_ring->ims_val & adapter->tx_ring->ims_val))
-		tx_cleaned = e1000_clean_tx_irq(adapter->tx_ring);
+		tx_cleaned = e1000_clean_tx_irq(adapter->tx_ring, budget);
 
 	e1000_clean_rx_irq(adapter->rx_ring, &work_done, budget);
 
@@ -5019,7 +5021,7 @@ static int e1000_tx_map(struct e1000_ring *tx_ring, struct sk_buff *skb,
 			i += tx_ring->count;
 		i--;
 		buffer_info = &tx_ring->buffer_info[i];
-		e1000_put_txbuf(tx_ring, buffer_info, true);
+		e1000_put_txbuf(tx_ring, buffer_info, true, 0);
 	}
 
 	return 0;
-- 
2.43.0

