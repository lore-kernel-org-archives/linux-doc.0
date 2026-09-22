Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495005540BF
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087325; cv=none; b=f7BxNfk8DdyOUYln/N0dD9HubetD8R1re5DVIXoJdREOzRtp90RhhRlpYKzEgRUDAPmXuoNGNEaNjP5BxIFLW6i6VVLKK4Kx2Ii6W6vNjt78kJFETGHKghGGZha8H2nPTkHW6QPwLs3JN90j8wCfc8voMw6N7HTpcLfvVBSqjTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087325; c=relaxed/simple;
	bh=SVtzUg4Eb+h//swwQumGXMTtjoutlA+uq+ys1ApPWSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZZ5aYdJEKxQB88ss86GvRpKd7TJUSaDd7Z2iEm2w+Z7KQzLagOdE5e2G4Veg6AzFzs3pMYkuzxBZqRUM7YYc10v8gyA0GzbtEawqgHoPfdbZct0Nupr42pExRA4sSEXVdztlCb6pBfnkt3gCcL6bYOmzL8MsPvEPR2bfkDhDF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bdB02Ipb; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bdB02Ipb"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso4229357e87.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 07:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087321; x=1790692121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2cIcFD9n/tIhle0FL6VW14T8JQcamu6z/X7FWTdDmM=;
        b=bdB02IpbBAv4XESwKAcJhUt9dgcHa2erpxr9NqcM1HXuWC5Uzyt+Kidg3uKs4LwkYq
         8IJVUfJ+7WJRtirgB7oeAQ2xn5xFPJgocGqpERQjaEGcr7cNFVGMRq1gopkUaxBr0eK/
         dO2AjVfBEWrtDyo1bAX2i9x95oCspoZ2J26BcJ1eoAtfZZw4yLZP1S4jQyElMH+IwKvf
         24BJhV5Xw+yCEnRYvTmIk/sWWD5Syp7aCYs0/IGYzPqPTPOpvwT4Yt14ZqT5USp6SSta
         AT449txM9XKTszVDeIPq8q7pKLGm6cCQ9FKo9Na2XXwtsFuyOIkcwjEoPJ2V3BNkaC8I
         Mj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087321; x=1790692121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2cIcFD9n/tIhle0FL6VW14T8JQcamu6z/X7FWTdDmM=;
        b=WfXwLmPg+Jssb7Ely89x3lq4JXhUjF/+u2PQOUWERf0+VFVtH2zIaN5ElH8AY0sxjc
         M5tzpGMNrN9GmaL8I1jiCpVfPvNIM2GVvAgZ6yR3b4ihYvc5VH1pDiqrhtXQkYvJLhA4
         M/VXQDMJAc4EdJVyMOZVvbGsF25ygWyQOCstzNRClOKEZ//gejYTSDmfmDdKxjOmgarH
         Owv1P3YCuVZg59dWgRnNnAxv4/yWf36BLh208RscoV8aoDAtY0gz41bTogZeJ/jafIOF
         thYGnImtYBszdtHaPNqyCHSy9sWolYXklUxhbmfKC1/SFsHm4Z5a/71yDEL5BxOLQvl3
         FEow==
X-Gm-Message-State: AFuF++luHia6Jkb9+Dp3OJNfZP91v6Nsixn5wQjprr/03GZbn5Xwd0do
	SQT8OVU8d90FM+seXQ9F23PahaSfBAIRxMKlwgyZffM6+YsqMw8wwofq
X-Gm-Gg: AYBFou2yZV2zjJkyV5zYSygiSu+cSS+WfSRdMrHAc/Ctg+Nx6+gFtpoHg03EMs0/YgG
	fsgWmcwpjvW7ZTIEO9AQMh0atohXQhMlGnRFZ+zhvYTCTrIChJepqciZhZ0oRP7AioGT+xy86Ld
	VYxpU38EvGKKHn1h5z7thSuogISBJGb9j/fAvLQBRAN+O0+EtQWKlemsBvGM527QHnCHmecNdd8
	7GaeD3IZoVGKVfv/jcZ/s5DsOlq0PNO+ty0urK84pBURmiywzyVmlzcvsIB1suJEYWf31jjgseL
	QYH2Lqcd0ZK53wmv0M6L92m1jUfTqQT0N4Oy+T31jwo+eZqz8NWVH90L6nBPkxQ4VJmFXsnldIk
	yIMNM8uUoOQzkeVHrtl6408IwG/kDWtpHV0qfSFGpbWzCjc6nrrKFMTv71WCzonR7mKIwghYxkm
	aKTRBVQrILSr+7Vdv2C5ZFPSeVlcsnaQ8xXGwD5qamSIft7q8bX24RhIwEPQ4Ckn2faMug7acM1
	f1bDWkRCHMG/Df4Jd4pcWPmO3eYdIkEapp0/dhm
X-Received: by 2002:a05:6512:1329:b0:5b4:adb1:b25b with SMTP id 2adb3069b0e04-5b8c17f1feamr4505886e87.14.1790087321044;
        Tue, 22 Sep 2026 07:28:41 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d2064sm589691e87.24.2026.09.22.07.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:28:40 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next 3/9] ptp: ocp: hand the TMC bus back once on an acquire timeout
Date: Tue, 22 Sep 2026 17:28:23 +0300
Message-ID: <20260922142829.57740-4-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260922142829.57740-1-maimon.sagi@gmail.com>
References: <20260922142829.57740-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adva_x1_mblaze_acquire() ran the hand-back itself before returning
-ETIMEDOUT, and adva_x1_bus_claim() then called adva_x1_bus_release() for
the same error, which runs it again.

Both write MBLAZE_RELEASE and poll for the grant to drop for up to
MBLAZE_RETRIES * MBLAZE_RETRY_US, and both run with the i2c root adapter
lock held, so a single failed claim could hold the shared controller for
half as long again and log "TMC bus still granted after release" twice for
one failure.

Leave it to the release path, which the claim already calls.

Fixes: 3b815e29966f ("ptp: ocp: add TAP CPLD access for ADVA TimeCard X1")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 510083dc750a..feb61355078a 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -4526,10 +4526,6 @@ static int adva_x1_mblaze_acquire(struct ptp_ocp *bp)
 			return 0;
 	}
 
-	/* Drop the request we gave up on.  Any error from the hand-back is
-	 * subsumed by the -ETIMEDOUT we are already returning.
-	 */
-	adva_x1_mblaze_release(bp);
 	return -ETIMEDOUT;
 }
 
@@ -4647,6 +4643,12 @@ static int adva_x1_bus_claim(struct ptp_ocp *bp)
 	i2c_lock_bus(adap, I2C_LOCK_ROOT_ADAPTER);
 	bp->cpld_adap = adap;
 
+	/* adva_x1_bus_release() runs the hand-back, so the acquire path does
+	 * not do it itself: both poll for the grant to drop for up to
+	 * MBLAZE_RETRIES * MBLAZE_RETRY_US with the adapter lock held, and
+	 * doing it twice only holds the shared controller for longer and
+	 * logs the same failure twice.
+	 */
 	ret = adva_x1_mblaze_acquire(bp);
 	if (ret) {
 		adva_x1_bus_release(bp);	/* keeps the acquire error */
-- 
2.47.0

