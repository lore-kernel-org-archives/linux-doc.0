Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D76187D913
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 07:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbfH2Hqh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 03:46:37 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:49762 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbfH2Hqc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 03:46:32 -0400
Received: by mail-pf1-f202.google.com with SMTP id s10so1834286pfd.16
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 00:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=nhjHwCHt3mcz+mHDiVxN7s8L1KuUZ7MDwDAfLe16I50=;
        b=G+4eBBbE8eR+JweFO/MTbU/JiiK//ZmQj8k/LyrXbCGTThb38w/Z2lUm+J9+GnNM0R
         ILZAbYqpRKL7TOIZvfQiUJ2cF39/iD9rfGRzN/JPmUP0imOiTAzvaNMocnkNuQkRpez1
         TeFD7m5SShMLKZ99sCn6+3Jk0GWByzZ/IZjTTkJhmHdk/U8KSb8jext129vtnUphdVPK
         3Og8DoR1JhhS8QHP8PSei9z2OIoEIJgw7WByG4I5s8EIdtWDrfnC1s2xxQI7P6I0R2oo
         vZCWREqieybOCkNKb7WgvgWuO6NUQORyGlcpSxF+myfSq3RilEg/tbt3CAbeESXosLmc
         vLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=nhjHwCHt3mcz+mHDiVxN7s8L1KuUZ7MDwDAfLe16I50=;
        b=ICYFZNme7OTNpQaFr/175D9cYT/q351qyJxv0fh2J12zIQtaePlwEUVF1MihB2GDQ8
         qLeSbZPlKWpWSnGw0gFzmmWdBAjD9BVBwsyhlWlHiCGzPWPYatdnUeHy+Yn8PSSvf3/5
         9MUpuZtAIGnXfGOuiU4pr2KmKOiGVJteMl4Fs52vdai11L2xNvpwc5qKdAYezbohuOIa
         qgOLUq+XhthRJkOFpyE7PTnAQSQz/vyrM8lbMs3Z4JTkXlJ2VQ9PvDmg1T3zvVO/XlTr
         nTDd0ETBJbDTmLd2bPcuDLAHyWfzUp5reWBUIAwiZJPOBfpyfAft3HvdR1qLR435+ccP
         7yVw==
X-Gm-Message-State: APjAAAUThWHZ03nKmyVkNBuLgpUemDNhyT8x5G3Mngm6NaU8rUzj66Pv
        lve8H3G8wHu4onyZpATtw4T2rZyr6Ce9H0s=
X-Google-Smtp-Source: APXvYqxjRrI7v0tAcH4lDhIBqUhl0wBMcJY40NePOKQ5MWBcbB/tbpokA1E16lgkYG8HCTLquA1Ns3qi+HNbWZE=
X-Received: by 2002:a65:690f:: with SMTP id s15mr6855732pgq.432.1567064791199;
 Thu, 29 Aug 2019 00:46:31 -0700 (PDT)
Date:   Thu, 29 Aug 2019 00:46:03 -0700
In-Reply-To: <20190829074603.70424-1-saravanak@google.com>
Message-Id: <20190829074603.70424-8-saravanak@google.com>
Mime-Version: 1.0
References: <20190829074603.70424-1-saravanak@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v10 7/7] of: property: Add "depends-on" parsing support to of_fwnode_add_links()
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-acpi@vger.kernel.org, clang-built-linux@googlegroups.com,
        David Collins <collinsd@codeaurora.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If dependencies inferred by of_fwnode_add_links() result in a cycle, it
can prevent the probing of all the devices in the cycle. The depends-on
property has been added to explicitly override inferred dependencies
when they create a cycle.

Add depends-on parsing support to of_fwnode_add_links() so that
platforms with cyclic dependencies can use "depends-on" to break the
cycle and continue successfully probing devices.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 420c2d428184..78a262e24686 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1106,6 +1106,12 @@ static struct device_node *parse_interconnects(struct device_node *np,
 				"#interconnect-cells");
 }
 
+static struct device_node *parse_depends_on(struct device_node *np,
+					    const char *prop_name, int index)
+{
+	return parse_prop_cells(np, prop_name, index, "depends-on", NULL);
+}
+
 static int strcmp_suffix(const char *str, const char *suffix)
 {
 	unsigned int len, suffix_len;
@@ -1151,6 +1157,7 @@ static const struct supplier_bindings bindings[] = {
 	{ .parse_prop = parse_clocks, },
 	{ .parse_prop = parse_interconnects, },
 	{ .parse_prop = parse_regulators, },
+	{ .parse_prop = parse_depends_on, },
 	{},
 };
 
@@ -1203,6 +1210,12 @@ static int __of_link_to_suppliers(struct device *dev,
 	struct property *p;
 	int ret = 0;
 
+	if (of_find_property(con_np, "depends-on", NULL)) {
+		if (of_link_property(dev, con_np, "depends-on"))
+			ret = -EAGAIN;
+		return ret;
+	}
+
 	for_each_property_of_node(con_np, p)
 		if (of_link_property(dev, con_np, p->name))
 			ret = -EAGAIN;
-- 
2.23.0.187.g17f5b7556c-goog

