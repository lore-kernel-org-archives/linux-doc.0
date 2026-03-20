Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF502D0C82
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 01:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773969908; cv=none; b=sURUWt2nZEQYbHpLfc8uKy4twfGqok8Nb9sosrKe2dNW6kSrlwsq7gIiWH3ULldNu7cX16Lb4cm1kATxw3ZGBMQokm5DnGCr8kWFWcJBXrDGsM8vA8mJt+rJrEjLGTB3H9Lwv5bcmAmfE5yLRCc6evyjBCOMMzglP/DyacnckpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773969908; c=relaxed/simple;
	bh=fiWuZ9fcbL8sdigaSwTTvp8tHDm8kXTBMV+vvmAza+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L3pFX6GxERoAK7Rc58mewbHQjryk/sRjtgm0k3+UJwP3+NwMPTngipLwes1hAVyN0GCiLy1QnJhtUi1WCUntXkyqM28tit2D7cctweuuk3rv5uOQKIxR1Trj4uK1nUpgg30UA+c4GfbpUIqpxnxuDLOpvaNjRT6LI5jnZCVlXgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fomichev.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1279eced0b9so216967c88.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 18:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969906; x=1774574706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7EJnW3kdUcA/mWdICiYp+Buoz7NoSHqg/f92gpxvDwE=;
        b=GB0nMQ9TVJQQcO8wS1Mpko/5bRgs/OfV+kh8eVHxZjVCYVba1FJhtjdt+/vJQ/MjLV
         g9PHgQEz9wHYD1nC4oSfKE3FmBD2Iz1SQRNCqaF4hOZqEqKYPL6YTPGwNG0WgMlf2nHO
         jf43NlBOrR+TSp6wNU/XpetGW2RHJ1myI7dRFDBbVwivR5NpDwc4ASYnhL7vhZU4u2Vc
         cvG1qj4ASHrwRdcWA0yFU+5NLT/2j2pcYF853Ddg50g/qIS09nFFD/CbEq1VQi0jeNUT
         yf8V20JPFYI/K774RFHxfp8wBjBifmcVmritl3MBLUVmV1R0/AJDjKGehahNR+J7QmOD
         Jy5A==
X-Forwarded-Encrypted: i=1; AJvYcCVqrTseOlfxxBfL0tANuaGxebukFZ5J8IYdD31QFPTxbZoR1Yf4vq6OCZ9IvQgD31dY2xMsafEhgHY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Rqq6uUsI66ylIOfsRmT/g8lkwxmkXRrjj8FN6ZK6rb4WnrGg
	fedXUnszPz1OBhOK1gI0Mjb2ihWVMn2O/MwMppujI0rUPBj9kOkFOSk=
X-Gm-Gg: ATEYQzzdrA/rqzd6cc4VDzDQ+MJNcqTSpNLpxNVmP7ub4l06TTaY3pKBRIWqd/t+5FR
	bm5mQS3M2Efs5Zkadm65FOgGrdgObbcs13Mw9j4usnn3UYvLwXtSUhCMZDbF8XJsXnQTY1PfSU2
	7T/pRcztrp67uqmAoWTbVWDe4bnkBQodwwgC1bCVPhP+btPNYsgHyDlPP2QivC5KXfbic7T8si8
	IN8+H4nsA2Wo7jg3a9XQCt/B2N2kkXF0mJqIZM1L3kCOzIj54PhsVUcMFxiwXV0TMF21cxT8dk/
	LGN4vJfqmiDv6TMnRRB1DszG7u0qvZhbIKa2pNVDuS0ztEh307J/dagMc37Qw2N42xHxX5h1zXg
	mdP4dbW+6JSK8Ig9bXpmf9bKTOczJJb2ssKXjs8bDKcVjzdtXz37mGNnJNgto8XPW8yScpef3GL
	RfWghC/wLKkNScbQd6P7Z2SBMEO2O/fMAobkL/jZMfyYeqUx+O/7GBf81qACwuiDxJZXJSo1/FT
	LNKe7bH+ElzSBnCUg==
X-Received: by 2002:a05:7022:ec18:b0:128:d17b:e7ab with SMTP id a92af1059eb24-12a726f6573mr546108c88.36.1773969905386;
        Thu, 19 Mar 2026 18:25:05 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a736b952asm749391c88.12.2026.03.19.18.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:25:05 -0700 (PDT)
From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	alexanderduyck@fb.com,
	kernel-team@meta.com,
	johannes@sipsolutions.net,
	sd@queasysnail.net,
	jianbol@nvidia.com,
	dtatulea@nvidia.com,
	sdf@fomichev.me,
	mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com,
	willemb@google.com,
	skhawaja@google.com,
	bestswngs@gmail.com,
	aleksandr.loktionov@intel.com,
	kees@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: [PATCH net-next v3 02/13] wifi: cfg80211: use __rtnl_unlock in nl80211_pre_doit
Date: Thu, 19 Mar 2026 18:24:50 -0700
Message-ID: <20260320012501.2033548-3-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320012501.2033548-1-sdf@fomichev.me>
References: <20260320012501.2033548-1-sdf@fomichev.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nl80211_pre_doit acquires rtnl_lock and then wiphy_lock, releasing
rtnl while keeping wiphy_lock held until post_doit. With the
introduction of rx_mode_wq and its flush in netdev_run_todo, calling
rtnl_unlock here creates a circular lock dependency:

  Chain exists of:
    (wq_completion)rx_mode_wq --> rtnl_mutex --> &rdev->wiphy.mtx

   Possible unsafe locking scenario:

         CPU0                    CPU1
         ----                    ----
    lock(&rdev->wiphy.mtx);
                                 lock(rtnl_mutex);
                                 lock(&rdev->wiphy.mtx);
    lock((wq_completion)rx_mode_wq);

Switch to __rtnl_unlock to skip netdev_run_todo in nl80211_pre_doit.
This seems safe because we run before the op.

Link: http://lore.kernel.org/netdev/69b5ad67.a00a0220.3b25d1.001a.GAE@google.com
Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
---
 net/core/rtnetlink.c   | 1 +
 net/wireless/core.c    | 1 +
 net/wireless/nl80211.c | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index dad4b1054955..b1bfb4a4aedd 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -150,6 +150,7 @@ void __rtnl_unlock(void)
 		head = next;
 	}
 }
+EXPORT_SYMBOL_NS_GPL(__rtnl_unlock, "NETDEV_INTERNAL");
 
 void rtnl_unlock(void)
 {
diff --git a/net/wireless/core.c b/net/wireless/core.c
index 23afc250bc10..a78a9b613c94 100644
--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -41,6 +41,7 @@ MODULE_AUTHOR("Johannes Berg");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("wireless configuration support");
 MODULE_ALIAS_GENL_FAMILY(NL80211_GENL_NAME);
+MODULE_IMPORT_NS("NETDEV_INTERNAL");
 
 /* RCU-protected (and RTNL for writers) */
 LIST_HEAD(cfg80211_rdev_list);
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index e15cd26f3a79..f8ed8730cf1c 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -18203,7 +18203,7 @@ static int nl80211_pre_doit(const struct genl_split_ops *ops,
 		__release(&rdev->wiphy.mtx);
 	}
 	if (!(internal_flags & NL80211_FLAG_NEED_RTNL))
-		rtnl_unlock();
+		__rtnl_unlock();
 
 	return 0;
 out_unlock:
-- 
2.53.0

