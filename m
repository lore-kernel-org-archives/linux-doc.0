Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D53433DEFC
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 03:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370244; cv=none; b=d3mwEPIlz1ZydaFJIv7owU7uHf/TvQsnvbh2oTa5gkusjsl+HjJ76eMOaAe62kmRKyrrVlmYEa2P3o36TvkZ+f/OLZj1Q5zenItt3gBmhIntx6YRcJIkj/Jjcbj5MiIPnDrx0FDwp8q4SrGeUHVvyvIanwfa/R4nQm1CU1UuJ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370244; c=relaxed/simple;
	bh=Dt2dFPyPh1ts6XuKsSKJICPZIpbd882zbThrm/OEsps=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYktN51yFh3pI6DGC2GWXw4BCZ0qNMoQPhFN31RWla060Ih87YlN1Yx5oC00OqHaXMqNfBHxqI/GjuHu+XW80Ezz+1FJuT9f1JT2sKFwNjGDzhTsJl6rmJIaTZEH8tf7mAKKkyzYRMBCFrq2LLA8x4LomUzcIla9pfJn2ASXjiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Jc0goBFa; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Jc0goBFa"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51720674eb7so52899741cf.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 20:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370241; x=1780975041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tW8ZkJFH1s/aeCdAEiQB7eOXHeRrYqV2OpgEHHCsa8=;
        b=Jc0goBFaHhvMOUNWHpB2OFY1+3Z2ZG2bVrLp14LmjWpFEj1F96fEgV4sx+AfBbDxkf
         YAL9w4sbxE0n179cV8HIBOXxYZLCn552xtJBnI2r4inWzzDmJAIgZiVPMVTUrmPRPfEt
         LCsnkIksFMmQspiZ+6wGR7RFgRdezeKLasxtN+XMC3WMOr5HAQP03sRtIpObnjhGRoKp
         1vrwm2vK/a05QiJrI6PNXrZ9ZXvnbE53j1pTb0zKXr3Ip7FT/x8DdBadERgxeB96KGFF
         WDAFJYRc246m2lQRdvMR39bvLdXOY24f3DyPwtuH3kW/Q0P3qokC9B6Pb52f9ZN1c8F0
         WfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370241; x=1780975041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6tW8ZkJFH1s/aeCdAEiQB7eOXHeRrYqV2OpgEHHCsa8=;
        b=AC6rxcXFc8pOhyTu8D7i5TI/2rr5R/4msugzT+5P/W94ndt6FOISQ0y3NtGL50Gvhr
         anyIyD7RRVnmWbW0uNGnP2rGIene/Nou4Xxg8X9vu+ewLTwELhmi51s/xHy55MxJSpij
         kPgm9ZKQFwu5zR4Btftxe2OLTL/Fi/4Qec/gKFmXBD542VDbaAY72+Up5rXrXmfSjyOJ
         pxehLys/Owz7+iksfAa3ROAEgyDCoNmtyNJN+TBxUiV/1QhQTzs+SZ+/YF8BNbY33biv
         d8ER+kENSzw4eKySeyny35Jbo6IS7WyJv3jWi/id6pdZlI53zPGauVbHJEGWFRbck75Q
         vr8w==
X-Forwarded-Encrypted: i=1; AFNElJ+7t8hjua9paTpce8e1ghkzotbDNto0BYzFaKLB6uti//lTgE4uv3FEkOtwSYMbaqdv7tF193OtR5o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMsw1qmJTljIony3aT5YoN0PcVZoBfLHDjXu32asdgr744teSg
	fQa54eBhae0KPyRtzPsfOKPY34PWq7Qmg7tZbdSi2miySkm6cjIRv9GAJOFrpIf/xIE=
X-Gm-Gg: Acq92OEGu/H2FD0p0Htvuyv/ENRZ35x/jXVvyuakU6PohXVeMwuJcmDu+h2Y4oYWqOC
	InQ9aOj5rBooY4skNqfz6AnFGEOSgMBsYfgAvRUe6Hc93JZUjLjI3sCo3gJXKHn9DhKry5aClO+
	cTg1CrvCypSZVmgxxmzML8jyr2KirAYgN1pKqjvleehHLtsvqu2bDVApqQHxCpfljfDFujiXAIB
	OVN5k9FhrKG1UOrGYOVo59eVw4p0zVsb55o3hSz/+T7pIzTsLr9Gcz2Nm3AxFFD7MzLQvmswz2K
	YX/neOGv+YCI6tS9ZEOPNuVx2ejoX2pcYs8H/fQKb1eQWkLTSG31qQo6js/3rvc3Y8UVtEUm441
	yxX+EiFqGV2MHUvnfkPSRhDQmUaIXPp+C+XCN1GJ3wZPpOLnDA9d7Oaqz6W1B3sUsQijF/2lNJY
	FzyXxpJJxnYJVNJoXedER79dQvqpZCZ2bQHoCq4rw34MeAcU2WGuYrxZ6y5ByZoA==
X-Received: by 2002:a05:622a:4c14:b0:50e:6377:197d with SMTP id d75a77b69052e-5173a6197f2mr192694801cf.8.1780370241637;
        Mon, 01 Jun 2026 20:17:21 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:21 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v5 02/13] liveupdate: avoid mixing cleanup guards with goto in luo_session_retrieve_fd
Date: Tue,  2 Jun 2026 03:17:06 +0000
Message-ID: <20260602031717.197696-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602031717.197696-1-pasha.tatashin@soleen.com>
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactoring luo_session_retrieve_fd() to avoid mixing automated
cleanup-style guards with goto-based resource release, which is not
recommended under the Linux kernel coding style.

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 5c6cebc6e326..7b2f9cbabb05 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -291,25 +291,24 @@ static int luo_session_retrieve_fd(struct luo_session *session,
 	if (argp->fd < 0)
 		return argp->fd;
 
-	guard(mutex)(&session->mutex);
-	err = luo_retrieve_file(&session->file_set, argp->token, &file);
-	if (err < 0)
-		goto  err_put_fd;
+	scoped_guard(mutex, &session->mutex) {
+		err = luo_retrieve_file(&session->file_set, argp->token, &file);
+		if (err < 0) {
+			put_unused_fd(argp->fd);
+			return err;
+		}
+	}
 
 	err = luo_ucmd_respond(ucmd, sizeof(*argp));
-	if (err)
-		goto err_put_file;
+	if (err) {
+		fput(file);
+		put_unused_fd(argp->fd);
+		return err;
+	}
 
 	fd_install(argp->fd, file);
 
 	return 0;
-
-err_put_file:
-	fput(file);
-err_put_fd:
-	put_unused_fd(argp->fd);
-
-	return err;
 }
 
 static int luo_session_finish(struct luo_session *session,
-- 
2.53.0

