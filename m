Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4121C433ED
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 14:41:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95B1C610D0
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 14:41:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbhDIOlQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 10:41:16 -0400
Received: from smtprelay0040.hostedemail.com ([216.40.44.40]:35552 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231946AbhDIOlP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Apr 2021 10:41:15 -0400
Received: from omf07.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id D0AED18002260;
        Fri,  9 Apr 2021 14:40:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf07.hostedemail.com (Postfix) with ESMTPA id 9828F315D79;
        Fri,  9 Apr 2021 14:40:58 +0000 (UTC)
Message-ID: <67bacd4825f9c8f1abc225146888c5a50deb924c.camel@perches.com>
Subject: Re: [PATCH v5 2/6] w1: ds2438: fixed if brackets coding style issue
From:   Joe Perches <joe@perches.com>
To:     Luiz Sampaio <sampaio.ime@gmail.com>, zbr@ioremap.net
Cc:     corbet@lwn.net, rikard.falkeborn@gmail.com,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Date:   Fri, 09 Apr 2021 07:40:57 -0700
In-Reply-To: <20210409030942.441830-3-sampaio.ime@gmail.com>
References: <20210405105009.420924-1-sampaio.ime@gmail.com>
         <20210409030942.441830-1-sampaio.ime@gmail.com>
         <20210409030942.441830-3-sampaio.ime@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Stat-Signature: urf9wyouciyc4gjhnguyi65jkhgmjoyk
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 9828F315D79
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19hG8hIgFyFkvYzDB7UVE1dtfJ3aPy7EkQ=
X-HE-Tag: 1617979258-960365
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2021-04-09 at 00:09 -0300, Luiz Sampaio wrote:
> Since there is only one statement inside the if clause, no brackets are
> required.
[]
> diff --git a/drivers/w1/slaves/w1_ds2438.c b/drivers/w1/slaves/w1_ds2438.c
[]
> @@ -287,9 +287,9 @@ static ssize_t iad_read(struct file *filp, struct kobject *kobj,
>  	if (!buf)
>  		return -EINVAL;
>  
> 
> -	if (w1_ds2438_get_current(sl, &voltage) == 0) {
> +	if (w1_ds2438_get_current(sl, &voltage) == 0)
>  		ret = snprintf(buf, count, "%i\n", voltage);
> -	} else
> +	else
>  		ret = -EIO;
>  
> 
>  	return ret;

to me this would look better using a style like the below:
(and it might be better using sysfs_emit and not snprintf too)

---
 drivers/w1/slaves/w1_ds2438.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/w1/slaves/w1_ds2438.c b/drivers/w1/slaves/w1_ds2438.c
index 5cfb0ae23e91..9115c5a9bc4f 100644
--- a/drivers/w1/slaves/w1_ds2438.c
+++ b/drivers/w1/slaves/w1_ds2438.c
@@ -279,7 +279,6 @@ static ssize_t iad_read(struct file *filp, struct kobject *kobj,
 			loff_t off, size_t count)
 {
 	struct w1_slave *sl = kobj_to_w1_slave(kobj);
-	int ret;
 	int16_t voltage;
 
 	if (off != 0)
@@ -287,12 +286,10 @@ static ssize_t iad_read(struct file *filp, struct kobject *kobj,
 	if (!buf)
 		return -EINVAL;
 
-	if (w1_ds2438_get_current(sl, &voltage) == 0) {
-		ret = snprintf(buf, count, "%i\n", voltage);
-	} else
-		ret = -EIO;
+	if (w1_ds2438_get_current(sl, &voltage))
+		return -EIO;
 
-	return ret;
+	return snprintf(buf, count, "%i\n", voltage);
 }
 
 static ssize_t page0_read(struct file *filp, struct kobject *kobj,
@@ -330,7 +327,6 @@ static ssize_t temperature_read(struct file *filp, struct kobject *kobj,
 				loff_t off, size_t count)
 {
 	struct w1_slave *sl = kobj_to_w1_slave(kobj);
-	int ret;
 	int16_t temp;
 
 	if (off != 0)
@@ -338,12 +334,10 @@ static ssize_t temperature_read(struct file *filp, struct kobject *kobj,
 	if (!buf)
 		return -EINVAL;
 
-	if (w1_ds2438_get_temperature(sl, &temp) == 0) {
-		ret = snprintf(buf, count, "%i\n", temp);
-	} else
-		ret = -EIO;
+	if (w1_ds2438_get_temperature(sl, &temp))
+		return -EIO;
 
-	return ret;
+	return snprintf(buf, count, "%i\n", temp);
 }
 
 static ssize_t vad_read(struct file *filp, struct kobject *kobj,
@@ -351,7 +345,6 @@ static ssize_t vad_read(struct file *filp, struct kobject *kobj,
 			loff_t off, size_t count)
 {
 	struct w1_slave *sl = kobj_to_w1_slave(kobj);
-	int ret;
 	uint16_t voltage;
 
 	if (off != 0)
@@ -359,12 +352,10 @@ static ssize_t vad_read(struct file *filp, struct kobject *kobj,
 	if (!buf)
 		return -EINVAL;
 
-	if (w1_ds2438_get_voltage(sl, DS2438_ADC_INPUT_VAD, &voltage) == 0) {
-		ret = snprintf(buf, count, "%u\n", voltage);
-	} else
-		ret = -EIO;
+	if (w1_ds2438_get_voltage(sl, DS2438_ADC_INPUT_VAD, &voltage))
+		return -EIO;
 
-	return ret;
+	return snprintf(buf, count, "%u\n", voltage);
 }
 
 static ssize_t vdd_read(struct file *filp, struct kobject *kobj,
@@ -372,7 +363,6 @@ static ssize_t vdd_read(struct file *filp, struct kobject *kobj,
 			loff_t off, size_t count)
 {
 	struct w1_slave *sl = kobj_to_w1_slave(kobj);
-	int ret;
 	uint16_t voltage;
 
 	if (off != 0)
@@ -380,12 +370,10 @@ static ssize_t vdd_read(struct file *filp, struct kobject *kobj,
 	if (!buf)
 		return -EINVAL;
 
-	if (w1_ds2438_get_voltage(sl, DS2438_ADC_INPUT_VDD, &voltage) == 0) {
-		ret = snprintf(buf, count, "%u\n", voltage);
-	} else
-		ret = -EIO;
+	if (w1_ds2438_get_voltage(sl, DS2438_ADC_INPUT_VDD, &voltage))
+		return -EIO;
 
-	return ret;
+	return snprintf(buf, count, "%u\n", voltage);
 }
 
 static BIN_ATTR(iad, S_IRUGO | S_IWUSR | S_IWGRP, iad_read, iad_write, 0);

