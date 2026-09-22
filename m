Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF2D55C1BA
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 14:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087337; cv=none; b=Bbpa4kjBfxXsOZnY7oOIPmLjYJ71Z6ECz/2vxkQ211jSscP2bRaCqSjfjpuk4ZWPMOEKeuGeZ8WK3h2UIYCG1fPtvo2NsKQLPdWguDd32DYh/5Qktv+DZST/nrqvvE6pBQ/IFT9PEkLNioSYZjFfsni+SwXoZ0wCo9WrFoItJxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087337; c=relaxed/simple;
	bh=LjFWXtBxX8T94YoQ6LqwowvWE59E53HE3eg72IgpkjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WDmlX3BQoHKk2gtIFrf1Aosy1rw3lLfNVzCGlTiWwdB9BzpBGEFSV1aC3noQa045JsrokdJhpsc4mjvSZsC23J5N2xyx823Pj9YkLWuibDa9OIH5EQznotNh3d+9SS5zkddFcU4R1g27KVM8v34X9KaHDoqDJqwkfM0YLX+u/Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsTNHPDq; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsTNHPDq"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso1077314e87.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 07:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087334; x=1790692134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElzIfLW9vsgs9qj3Q3n1oLfTLliMNpKpVYJ0kUF5UpQ=;
        b=YsTNHPDqoCOie/hcailZHkczEXqKkCCPBmdDCFHxP1J9Xj+y77g6qfYb1AMxuvoM8l
         ozMeihLSbDRnU2779bgyG21CkCzYU1GDWefo8al69vTQI5n0SQGlgGYFIsUlXSO7wVV/
         UFZtq7hrLq6bjNYKEUzrG8qYcA5MHJ+lx9PfkYWexNbnk4LIuRQmB5dWu241lpZZDCA8
         8thUOkuqsq7GjDIQudK8brofRUZ6uA6tS23Se6nyi8K+I767XyKXoEeJ9o1wUU6GObVC
         F2OcMUAoplR9UfaQKQnTqkfpiWR6A9YdIQOIotyLoqf7pzo/igOsBVxMBHrxejDHFV0V
         bLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087334; x=1790692134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ElzIfLW9vsgs9qj3Q3n1oLfTLliMNpKpVYJ0kUF5UpQ=;
        b=KkYyVwIXVnINrg9IMcOJE+1ApXNH7clXGW575Oi4adu/xEOyNr21ehGHjTHEYpSs44
         uxqoX0diXTaYdr1QQcEXRCCS9dxmoF3koGZWoEZXTRw7rKFGH5/Z7hS3GABzJmHUXn3N
         GuIZROwGOywOxi13gMqV+XRPaLGh3fBku4oIJkHw3mwl/5832mx7HxHFMs2nXNT6geQC
         +LZIR/Jiw8/98IcvXwzNa27gnu80vllTgmGAuG/7WeWhIqYM6VViH8v2OYt5sMmXLlFT
         Tv9pSNneF78wyvToW/VXbNcO4+6a2DSWRtPR6JI+/jQAz/V56kl7/GoIcaCF8wnhXACy
         8bbg==
X-Gm-Message-State: AFuF++mRzPvKzDfDf6U+9xQV5DbSgB/SI3Pu6fXCaEIReGKVqCO1Tkav
	/cUFZlQe1mczIjb6bkDrXVUXD0vCbRiIgd4vu/CuAKRXakSs4x570q5a/CQ9x+4U
X-Gm-Gg: AYBFou3j8KBMbJp8j0PeXWJ7ubqWzwbNKspcCV+huCsBwj/HnznLJOM9YO7WeWgTShw
	0KPjqldc72HzrCP592L1pt+xrUo2cErkyAPnBab4XfGAZVKIRbEDr3WkiE6oEQMWYcDclqU8nTM
	I+53R5IhEFyANsUsR0yVsc1fUSHGJwvSMDg4Df1/m/mXM86R6JP2X51ggvB7FA2IF8Zi/GgAmw9
	ZUW3KIhBeF11SQENBU83a3o8RGAY7fQtlLx68XmF4T+5iX0kC1Yrkuynk/yzY8HOtCsrITaPi7J
	yLyKo908Tenl+3N8lKfPYIv23YdDXBR5YRvKEdS9jZVBE7mzRWI42zO3fR1EHcH/4W7MIu5TwpK
	zaRpip7kMADEFlJn6GOZpHQ3YfaXK/LEzLzkQ2WA2dZG/HcZIvllbO4nnw1RwpmZ4Vn58XmA1hJ
	pgHENAvK5zIqz5xkJtKwcOfhCZfHUe6YXJkikPdekopvGFRBkn/xPmd783K7BF8JRhBRfl/ZjUC
	QKVUnNWQBBSxw3wOv/ThEN0PQ8gd3qCWi1vSfYj
X-Received: by 2002:a05:6512:1242:b0:5b8:9a95:e251 with SMTP id 2adb3069b0e04-5b8d293525bmr961353e87.25.1790087333547;
        Tue, 22 Sep 2026 07:28:53 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d2064sm589691e87.24.2026.09.22.07.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:28:53 -0700 (PDT)
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
Subject: [PATCH net-next 8/9] ptp: ocp: tolerate a latched FAILED when entering configuration mode
Date: Tue, 22 Sep 2026 17:28:28 +0300
Message-ID: <20260922142829.57740-9-maimon.sagi@gmail.com>
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

The first status wait after EN_CFG_TP used adva_x1_cpld_wait_ready(),
which turns a set CPLD_STATUS_FAILED into -EIO.  FAILED is latched across
operations and nothing in the driver clears it - the failure path only
sends DIS_CFG - so once a part had failed an operation, every later
"devlink dev flash ... component fw.cpld" would return -EIO at the enable
step, before reaching the ERASE and REFRESH that would put the part back
into a defined state.

That contradicts the recovery this driver relies on elsewhere: the page
loop documents an aborted update as recoverable because fw.cpld stays
advertised so the image can be written again.

Use adva_x1_cpld_wait_idle(), which waits the operation out whatever its
outcome, and let the CPLD_STATUS_ENAB check that follows decide whether
the part actually entered configuration mode.  machxo2_write_init() in
drivers/fpga/machxo2-spi.c tests FAIL the same way, after the enable has
completed rather than as a precondition for it.

Fixes: a4b7c15aa78f ("ptp: ocp: add TAP CPLD flashing via devlink")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 0d6d0c02882c..4f2bf54a23c2 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5018,9 +5018,16 @@ static int adva_x1_cpld_flash(struct ptp_ocp *bp, struct devlink *devlink,
 	 */
 	bp->cpld_in_config_mode = true;
 
+	/* wait_idle(), not wait_ready(): FAILED is latched across operations
+	 * and nothing here clears it, so treating it as fatal at the enable
+	 * step would make every later flash of a part that has failed once
+	 * return -EIO before reaching the ERASE and REFRESH that put it back
+	 * into a defined state.  ENAB below is what says the enable worked;
+	 * machxo2-spi.c likewise tests FAIL only after ISC_ENABLE completes.
+	 */
 	err = adva_x1_cpld_write(bp, CPLD_CMD_EN_CFG_TP);
 	if (!err)
-		err = adva_x1_cpld_wait_ready(bp, 5000);
+		err = adva_x1_cpld_wait_idle(bp, 5000);
 	if (err)
 		goto exit_config;
 
-- 
2.47.0

