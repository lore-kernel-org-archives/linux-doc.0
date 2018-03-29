Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 948AA7DD31
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Mar 2018 09:46:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752392AbeC2JqW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 05:46:22 -0400
Received: from s3.sipsolutions.net ([144.76.63.242]:35668 "EHLO
        sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752283AbeC2JqS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Mar 2018 05:46:18 -0400
Received: by sipsolutions.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <johannes@sipsolutions.net>)
        id 1f1U8O-0003cj-4f; Thu, 29 Mar 2018 11:46:16 +0200
Message-ID: <1522316775.5932.10.camel@sipsolutions.net>
Subject: nested structs parsing
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc:     linux-doc@vger.kernel.org, linux-wireless@vger.kernel.org
Date:   Thu, 29 Mar 2018 11:46:15 +0200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

For a while I haven't looked at my documentation for 802.11, and now I
noticed I'm getting warnings due to the nested parsing.

However, something seems to be wrong? I have, for example, this (in
net/mac80211/sta_info.h)

struct sta_info {
	...
        struct {
                u64 packets[IEEE80211_NUM_ACS];
                u64 bytes[IEEE80211_NUM_ACS];
                struct ieee80211_tx_rate last_rate;
                u64 msdu[IEEE80211_NUM_TIDS + 1];
        } tx_stats;
};

but I'm getting the following warnings now, with only "@tx_stats" being
described in the documentation:

net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.last_ack' not described in 'sta_info'
net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.last_ack_signal' not described in 'sta_info'
net/mac80211/sta_info.h:590: warning: Function parameter or member 'status_stats.ack_signal_filled' not described in 'sta_info'
net/mac80211/sta_info.h:590: warning: Function parameter or member 'msdu' not described in 'sta_info'

I can understand the first three of those, but not the last one? Why is
the last one not qualified?

If I change it to this:

        struct {
                u64 packets[IEEE80211_NUM_ACS];
                u64 bytes[IEEE80211_NUM_ACS];
                /**
                 * @last_rate: last TX rate
                 */
                struct ieee80211_tx_rate last_rate;
                /**
                 * @msdu: # of MSDUs per TID
                 */
                u64 msdu[IEEE80211_NUM_TIDS + 1];
        } tx_stats;

I still get a warning on "tx_stats.last_rate", but not on "msdu", which
is sort of obvious from the warning text, but also rather unexpected.

Normally I'd say that the "msdu" warning is originally wrong

However, I'd also argue that if I'm using inline declarations, I
shouldn't have to write it like this:

        struct {
                u64 packets[IEEE80211_NUM_ACS];
                u64 bytes[IEEE80211_NUM_ACS];
                /**
                 * @tx_stats.last_rate: last TX rate
                 */
                struct ieee80211_tx_rate last_rate;
	...
	} tx_stats;

since the comment is contained in the scope of tx_stats already, but
that seems to be what I'd have to do today?

At least fixing one of these to make it consistent would be good :-)

Thanks,
johannes
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
