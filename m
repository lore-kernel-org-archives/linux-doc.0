Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230800;
	b=r6Mc9x1Z71aQ70VVNrimh98MqPHJC7A02vIWOXyNMPWmtA2O16urshRODQjE1ShiUEcl
	 2SnnqYl0MNrDhoR5i/nlFWccssRipKB3J9+edZpj2gJSl986+Fxa6v521OhcM0xnxSkz8
	 XGIoTka1TcyX6UdlwQWTew8+ha27gKtTnCPwhnHk4p/eeIajUROupJ7dtiPR1LcmlB0M6
	 +iybMPd6v/3q+UQhIgLFiywhkYhDHARH59c7hoyTSxfqfys3ndbC06y2K+zA2E9KcUspD
	 1SZf+f/4YitBmcXXh+X54v5jkcYh16b+sPb7vZ2Ibx83/eEwcOaZ6VNX6ayGkhRFL1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zQWBm2KzcjyJTbZ4vsbbDLZy5idG2ggu74AoJJxfV0I=;
	b=vc7UtKyFaPLZw45z+4mo1nz9QhNkxTYh0kisF2/qzkO+qG3ztMcY8668cCmkQ8KVKckh
	 ymbpvAYiYPXFn9Vw25xcd3CqdoiKKl6yx1E6Dqxopgl+csM9sN/SdB2q6Dpl8/7quhAtd
	 ewtsZOAjaYWVEbWozAriblWu+YxBlC7MHG0QR3OTvfdHNElMcqN5xRaU3VKyq0KTQtH5M
	 SuaWRe08HpS2io5RW4EnJo7PS3+RcOAs1QDIzEsOy0jLl5htCZBiLdXayOr2pDeayyg9V
	 KRpsvP5wA6eMDKZ4zvBOtbzOxP7R9bEg5+ZAv8bbDhPp7maXYeKxsT6QJsfOjRf34yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vko2xca7;
	arc=none smtp.remote-ip=74.125.227.194
Received: from mail-pi2-f2.google.com (mail-pi2-f2.google.com [74.125.227.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09124606A334
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09124606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vko2xca7
Received: by mail-pi2-f2.google.com with SMTP id 41be03b00d2f7-cdac05f11bcso263958a12.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 05:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230799; x=1794835599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQWBm2KzcjyJTbZ4vsbbDLZy5idG2ggu74AoJJxfV0I=;
        b=vko2xca7Rrv4Ura/+Rn744rwlmIpt9E0fqDRA49hHo3KgKWjGw8vhMNlhg3xq4NeAB
         tOAgvrbPx3VlkNd/Ec8I0bxLuEhm76gW6xlKj1vVAFIGAOfDwe65vun0NTHnjI1+usUj
         35rGBAMwwTxjUzBO0JjDHdvDArEOE96q82Yp3bdBaNuwGjvVaCgme0EHFDz+6KfjTsB+
         uKBxkUzjjMauqKMxn+Aiop7AN+JZn+meKkARBr3B42YlICuhFMqn4LC7SKx9L8P3h1la
         r0lHMkbxHigZJAfny1/LvyQzg8f+C31hPAk2tUV09fqLkGxlZ4SgVlX1fzCPkIOiQz+E
         hwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230799; x=1794835599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQWBm2KzcjyJTbZ4vsbbDLZy5idG2ggu74AoJJxfV0I=;
        b=WYb8j/Lu0K+tMbIMLBwWwCGg++prqACz4i9zXrThkefhFpC6RGYpnov4Z9x/AyXqYp
         TXYLMjR+/38H7UNv7RaURiELqu/46bMGL2O3S/5jtYym19k0xHbL39bHeBY0AsgV/BOL
         h0hhX7sAswFVNt+h0v7OSNJ0HUCmu0Xmu/TvrU6w+IoA+OpStshF+F+17g/0fqZl+/bD
         8HBQHZ1fbUqDpTnplMe8WAr0iRXKlT4UQqPpo29R6/EP6xS+gaMluGJSw1VW8Gu2P+r4
         cn3nwYwPHd3JQX+UY8UjbyipRoaps0p0pRFjvEy2lfN7WM9pG9KyAaZgrV5CeHUzWWF/
         Efvw==
X-Forwarded-Encrypted: i=1; AL+hErE2SrSIUiCt67svyBkSwm38EnhdHaXks02AEWcpfwCkuEreQmbGJ+IvZnnGQI41f3yWnnctm3mwi2I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8byTkiGZsWxCvTaQy25OgZOPa+zzNYhyIGb+YNHE45agbB1J49
	IoCFDoqtzqVFQmJDRoO9Sxr857ZGXzEfvlWbMs8LPBWNIUC9JnI1PXou
X-Gm-Gg: AYBFou3iKISMtqH/5cODQP2YWhofrhomiaAmE6ApNvob8IDPyzHr838Q4Yso21jHN20
	k3PTwSKQnKHGct4j8cgj0iXjN/p/oOWszfjisINmkILSzI8QR2r5Ko8FDORCApASF7gBh74iGU6
	FN6N4Ju0Zj20l3V8owUeyDo5qMX7uZAF8K1P04V3W99vNRQkPZnMICm3BhsgfotVsa5HKs7SN72
	3SRB5x09hbwWo8jHDx7msiGHM2xiMSOxJLWMoJUd3gz8KZuje9eC6/ITtoyl7Ju2MiI2rBOkGBa
	fFxNMdeeOKhwIKdyVD0QlC7YLSiEJZKzOX+/rSgPuKQiC8TqxCNE6kRox6UzC8W3HdEU0ognd4p
	aQTJwdh94CZxrzvsVmM5R810oFN53ISDxELJjDQXuhdwxY70HVPZS8PU9kQ5xweTAlZrfuiOte1
	aSJMs2+beMBJnnk5u2NCw7jsVfzsIzrR5pZtfVUFXdOJzgCNU5xS2mm/FkIKCi087Nkziryi0Lv
	juBOz0InO5RyjunIiLCMXAZZMuQ/C3SW9aFNWGf1H+Smd7FHMJ8bJd6sUZ4TM3AOzOhndqL8pw/
	OgMYshWaWGTLBqil47F20nd0myMi6HwO78aFeA2RAzTfHuaNg+WmXTcPoNWV5uI3aVOOKkCckaA
	9Ja53XB2X
X-Received: by 2002:a05:6a21:488b:b0:3e0:eae8:7525 with SMTP id adf61e73a8af0-3eed3956cc4mr3311188637.64.1794230799422;
        Mon, 09 Nov 2026 05:26:39 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:39 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 1/6] fs/resctrl: Avoid division by zero in the MBA software controller
Date: Mon,  9 Nov 2026 21:26:16 +0800
Message-ID: <20261109132621.3862497-2-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinjie Ruan <ruanjinjie@huawei.com>

The software controller estimates the bandwidth after the next step as
cur_bw * (control + min_bw) / control and raises the control while the
target stays above that estimate.

MPAM allows the control to reach zero: its bandwidth control is a
16-bit fraction, so 0% is valid, and its step is non-zero. The
estimate then divides by zero in the MBM overflow worker. On x86 the
minimum equals the step, so the control never leaves zero and the
division is not reached.

Take the step up without evaluating the estimate when the control is
zero. Check first that the target is above the measured bandwidth so a
zero target does not oscillate.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 04e4ea612b7c..dbc6770508e6 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -749,11 +749,15 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_l3_mon_domain *dom_m
 	 * on a system with 10% granularity steps, check whether moving to
 	 * 40% would go past the limit by multiplying current bandwidth by
 	 * "(30 + 10) / 30".
+	 *
+	 * A zero min_bw lets the control reach zero, where the ratio is
+	 * undefined. Take the step up without evaluating it.
 	 */
 	if (cur_msr_val > r_mba->membw.min_bw && user_bw < cur_bw) {
 		new_msr_val = cur_msr_val - r_mba->membw.bw_gran;
-	} else if (cur_msr_val < MAX_MBA_BW &&
-		   (user_bw > (cur_bw * (cur_msr_val + r_mba->membw.min_bw) / cur_msr_val))) {
+	} else if (cur_msr_val < MAX_MBA_BW && user_bw > cur_bw &&
+		   (cur_msr_val == 0 ||
+		    user_bw > (cur_bw * (cur_msr_val + r_mba->membw.min_bw) / cur_msr_val))) {
 		new_msr_val = cur_msr_val + r_mba->membw.bw_gran;
 	} else {
 		return;
-- 
2.43.0

