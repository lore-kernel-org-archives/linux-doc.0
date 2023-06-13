Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D332EB64D7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jun 2023 13:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240290AbjFMNwb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Jun 2023 09:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236500AbjFMNw2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Jun 2023 09:52:28 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 720F21FEB
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 06:52:00 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30fcda210cfso425796f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jun 2023 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1686664317; x=1689256317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WaeJYs/uG6fynkKfa9zh2deKdFZIe8/Di6A1zgej6LU=;
        b=Q1TcKKMKKnZe7DzIPaTDFI6gquigAuW8XeW4+klDezAjpwuO6fGCnJ1f7r/u6KZ0ER
         O9dM1DXba6jhcO9WyqBBbXkOHVH51o+LTctGbKiFGcSH95isneJQPVjB5zHyiodmtN3Q
         iiKAFQe47MdbZTDN7b34IMWXoX3zXEDuCXxkBRbmTYHrBDa3wPpgoRjui2Igf2KIbXxJ
         LQWjxywaHFKOJAd0qWNhlGfaGxanYdhKtQUL87ogp+qDZ0PVjsxPh/zmXDXpLVRlr1QP
         CsMUeQ2Eo5dTH5eOxqCdjEV+d9P6uNSTayFwtj3BByZuvQAvlobd7CngPX5JuQ9zHbHY
         fMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686664317; x=1689256317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WaeJYs/uG6fynkKfa9zh2deKdFZIe8/Di6A1zgej6LU=;
        b=IOoLnEx37djvZocORkhfJuBpnow5FLb/yYhhlUnqRJmksfHChZSf4PA0bYBGLmk7Rq
         VlZXxGchnbwaztt5zJ7I09t38/a1AhYAeYQJcJsSJFReZ0+Jmm8GrN6EGUIzayzKqwI0
         oICYVm+YUiTebE1AXbQOD41sCX1zDxrYi1mcGTdGI8rOIuv69jPCnQZ/bdn82viEwHKv
         zVM1Rqu8ATKknCfNYOsuQ/dvfaOtqtKQCpD/ge/Dldl/DAqBIy2dx1ojm6noD+0WPe5x
         MDzIDWSmgh12MBo+IzslclyYn7Tms5ek1+KlsNeTK+HKm1+38RHLqy4Cxd3qvfDNEdDe
         9vrQ==
X-Gm-Message-State: AC+VfDy2m9FKWZOaecL+ob6r87kEXBTdkAw67k3KYWEoN+1AS6HaaU61
        +oxDjRB+/O4Swm6VrRGOwiGmlQ==
X-Google-Smtp-Source: ACHHUZ6tbmwrKTMNvbpuPLgT+1R9lK2K8a7nds1UQDOt+PvY6ORk2+AOkeh44wiUBJm89/taQrjyYQ==
X-Received: by 2002:adf:f548:0:b0:30e:1103:2e39 with SMTP id j8-20020adff548000000b0030e11032e39mr6622276wrp.58.1686664317375;
        Tue, 13 Jun 2023 06:51:57 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id n16-20020adfe350000000b0030e5b1fffc3sm15502558wrj.9.2023.06.13.06.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 06:51:56 -0700 (PDT)
Date:   Tue, 13 Jun 2023 15:51:55 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Petr Oros <poros@redhat.com>
Cc:     Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        kuba@kernel.org, vadfed@meta.com, jonathan.lemon@gmail.com,
        pabeni@redhat.com, corbet@lwn.net, davem@davemloft.net,
        edumazet@google.com, vadfed@fb.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, saeedm@nvidia.com, leon@kernel.org,
        richardcochran@gmail.com, sj@kernel.org, javierm@redhat.com,
        ricardo.canuelo@collabora.com, mst@redhat.com, tzimmermann@suse.de,
        michal.michalik@intel.com, gregkh@linuxfoundation.org,
        jacek.lawrynowicz@linux.intel.com, airlied@redhat.com,
        ogabbay@kernel.org, arnd@arndb.de, nipun.gupta@amd.com,
        axboe@kernel.dk, linux@zary.sk, masahiroy@kernel.org,
        benjamin.tissoires@redhat.com, geert+renesas@glider.be,
        milena.olech@intel.com, kuniyu@amazon.com, liuhangbin@gmail.com,
        hkallweit1@gmail.com, andy.ren@getcruise.com, razor@blackwall.org,
        idosch@nvidia.com, lucien.xin@gmail.com, nicolas.dichtel@6wind.com,
        phil@nwl.cc, claudiajkang@gmail.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, mschmidt@redhat.com,
        linux-clk@vger.kernel.org, vadim.fedorenko@linux.dev,
        Jiri Pirko <jiri@nvidia.com>
Subject: Re: [RFC PATCH v8 06/10] netdev: expose DPLL pin handle for netdevice
Message-ID: <ZIh0e5b/xp6H85pN@nanopsycho>
References: <20230609121853.3607724-1-arkadiusz.kubalewski@intel.com>
 <20230609121853.3607724-7-arkadiusz.kubalewski@intel.com>
 <343e2638d2e9b3d13216235f85c2d1dae2634881.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <343e2638d2e9b3d13216235f85c2d1dae2634881.camel@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mon, Jun 12, 2023 at 11:17:23AM CEST, poros@redhat.com wrote:
>Arkadiusz Kubalewski píše v Pá 09. 06. 2023 v 14:18 +0200:
>> From: Jiri Pirko <jiri@nvidia.com>

[...]


>> +static size_t rtnl_dpll_pin_size(const struct net_device *dev)
>> +{
>> +       size_t size = nla_total_size(0); /* nest IFLA_DPLL_PIN */
>> +
>> +       if (dev->dpll_pin)
>> +               size += dpll_msg_pin_handle_size(dev->dpll_pin);
>
>Hi Arkadiusz,
>
>net_device->dpll_pin is only valid if IS_ENABLED(CONFIG_DPLL)
>But the code in net/core/rtnetlink.c doesn't respect that.
>If CONFIG_DPLL is not set, net/core/rtnetlink.c cannot be compiled.
>
>Regards,
>Petr 

You are correct. Here's the squash-patch to fix this. Arkadiusz, could
you please make the squash? Thanks!

diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
index e6efc17aaf26..00dc96c3ade4 100644
--- a/drivers/dpll/dpll_netlink.c
+++ b/drivers/dpll/dpll_netlink.c
@@ -303,12 +303,14 @@ dpll_cmd_pin_fill_details(struct sk_buff *msg, struct dpll_pin *pin,
 
 size_t dpll_msg_pin_handle_size(struct dpll_pin *pin)
 {
-	return nla_total_size(4); /* DPLL_A_PIN_ID */
+	return pin ? nla_total_size(4) : 0; /* DPLL_A_PIN_ID */
 }
 EXPORT_SYMBOL_GPL(dpll_msg_pin_handle_size);
 
 int dpll_msg_add_pin_handle(struct sk_buff *msg, struct dpll_pin *pin)
 {
+	if (!pin)
+		return 0;
 	if (nla_put_u32(msg, DPLL_A_PIN_ID, pin->id))
 		return -EMSGSIZE;
 	return 0;
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index b002e3cc9943..82ad12fd4266 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -3967,6 +3967,16 @@ int dev_get_port_parent_id(struct net_device *dev,
 bool netdev_port_same_parent_id(struct net_device *a, struct net_device *b);
 void netdev_dpll_pin_set(struct net_device *dev, struct dpll_pin *dpll_pin);
 void netdev_dpll_pin_clear(struct net_device *dev);
+
+static inline struct dpll_pin *netdev_dpll_pin(const struct net_device *dev)
+{
+#if IS_ENABLED(CONFIG_DPLL)
+	return dev->dpll_pin;
+#else
+	return NULL;
+#endif
+}
+
 struct sk_buff *validate_xmit_skb_list(struct sk_buff *skb, struct net_device *dev, bool *again);
 struct sk_buff *dev_hard_start_xmit(struct sk_buff *skb, struct net_device *dev,
 				    struct netdev_queue *txq, int *ret);
diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index ebe9ae8608fc..67dd455e15c7 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -1056,8 +1056,7 @@ static size_t rtnl_dpll_pin_size(const struct net_device *dev)
 {
 	size_t size = nla_total_size(0); /* nest IFLA_DPLL_PIN */
 
-	if (dev->dpll_pin)
-		size += dpll_msg_pin_handle_size(dev->dpll_pin);
+	size += dpll_msg_pin_handle_size(netdev_dpll_pin(dev));
 
 	return size;
 }
@@ -1790,11 +1789,9 @@ static int rtnl_fill_dpll_pin(struct sk_buff *skb,
 	if (!dpll_pin_nest)
 		return -EMSGSIZE;
 
-	if (dev->dpll_pin) {
-		ret = dpll_msg_add_pin_handle(skb, dev->dpll_pin);
-		if (ret < 0)
-			goto nest_cancel;
-	}
+	ret = dpll_msg_add_pin_handle(skb, netdev_dpll_pin(dev));
+	if (ret < 0)
+		goto nest_cancel;
 
 	nla_nest_end(skb, dpll_pin_nest);
 	return 0;

