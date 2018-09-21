Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CF5E07DD50
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 00:37:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388699AbeIUGXO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 02:23:14 -0400
Received: from mail-qt1-f181.google.com ([209.85.160.181]:34434 "EHLO
        mail-qt1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbeIUGXO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 02:23:14 -0400
Received: by mail-qt1-f181.google.com with SMTP id x23-v6so223607qtr.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Sep 2018 17:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dd2gQ8alDNqh0/9yBLGatUlP0YdFYr+gGtNvz2yVS0E=;
        b=XA172QN8TbISuBhdGthUblG1T18IQkAW9yuX55Ohwtvapz2RaOdLUHtSb4aC/KMkPf
         5QNpAhnkZFOVrBow0jCYTQvuL4htP7CWFvj+W1iOAufVfqu3qQZ6tIrxZTO5IirhlMAY
         BiNWAacSL+tkNOA5PdnenZUU/1XP8DwPvw5zNek3BEL5+J1fQButLKCE2oaHEgJ58Vab
         idbL2T1yboTKBRpoB4VRkW8Mg44ZrApm37s7ZUAVRLwSpDLeRsXZ1lPo9+CpU4IAkX6U
         JNP/S9SIu3+VOC7vxaFtpKI4fUFLZ/30GO7eHgVor74igQm99DfMNKxtOOBhbB/HRh1q
         suag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dd2gQ8alDNqh0/9yBLGatUlP0YdFYr+gGtNvz2yVS0E=;
        b=YQroY/+U/ebwZDucGfwxNNS6YFSDWXdpI1mBeQfn6Ogtllg+Tp6Uj2lBDl1iL1Orkt
         WWMB3Q0EsMAZ1P1m0qIO1AoASTRohV68TyPxCPeFAPOg5KI9beOql4D8lv144e6CjEe2
         gtIphwBiV+Q8LHiUNQceFdHdq5VinwEKFXI6DmPS3epiz7iczaujRZxNdiHawf0TPVmF
         ErJ8rMsWgYRhfFHHsQAjWpc4MXZfSoDp4QapxFDgQRcAYfItujljjXpU8kBMSZYYFrNN
         adrIxpGoTgvphZaA5gE2Ie8aSlO/e6FJQE1SEFLTCtX79b4xbZJqMrmZa9gB0xOVJQoK
         C/ng==
X-Gm-Message-State: APzg51DN8OiJvT77/FSESaFv6TX3+liKDSoPvpE4sT6k8jQodxNdP/2E
        g81PhWFDE90t6KnSh9aEHfg=
X-Google-Smtp-Source: ANB0VdYEHelcMSIrGqKrifW6SlO3j0pvz2hs0OTkAtiSf4LOSRKTXrBkKEAU3/Pa4RYk4QoEELyF9g==
X-Received: by 2002:ac8:3759:: with SMTP id p25-v6mr29891134qtb.310.1537490223079;
        Thu, 20 Sep 2018 17:37:03 -0700 (PDT)
Received: from localhost.localdomain (host-64-47-119-29.masergy.com. [64.47.119.29])
        by smtp.gmail.com with ESMTPSA id m51-v6sm19115402qtc.85.2018.09.20.17.37.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Sep 2018 17:37:02 -0700 (PDT)
From:   Michael Vlahos <micvlas@gmail.com>
To:     corbet@lwn.net
Cc:     dan.j.williams@intel.com, olof@lxom.net,
        gregkh@linuxfoundation.org, clm@fb.com, rostedt@goodmis.org,
        linux-doc@vger.kernel.org, tytso@mit.edu,
        Michael Vlahos <micvlas@gmail.com>
Subject: [PATCH] Modify Code of Conduct
Date:   Thu, 20 Sep 2018 17:34:30 -0700
Message-Id: <20180921003430.22901-1-micvlas@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

to make it more applicaple to real world software develoment by making
it focus on software and dephasizing contributor's personal traits.

The changes also attempt reduce the Code of Conduct's potential for abuse
by people of any agenda who would seek to use it for a power grab.

Signed-off-by: Michael Vlahos <micvlas@gmail.com>
---
 Documentation/process/code-of-conduct.rst | 77 +++++++++++++++--------
 1 file changed, 50 insertions(+), 27 deletions(-)

diff --git a/Documentation/process/code-of-conduct.rst b/Documentation/process/code-of-conduct.rst
index ab7c24b5478c..54a6784cd0d7 100644
--- a/Documentation/process/code-of-conduct.rst
+++ b/Documentation/process/code-of-conduct.rst
@@ -1,4 +1,4 @@
-Contributor Covenant Code of Conduct
+Code of Conduct
 ++++++++++++++++++++++++++++++++++++
 
 Our Pledge
@@ -6,10 +6,25 @@ Our Pledge
 
 In the interest of fostering an open and welcoming environment, we as
 contributors and maintainers pledge to making participation in our project and
-our community a harassment-free experience for everyone, regardless of age, body
-size, disability, ethnicity, sex characteristics, gender identity and
-expression, level of experience, education, socio-economic status, nationality,
-personal appearance, race, religion, or sexual identity and orientation.
+our community a harassment-free experience for everyone; a place where all that
+matters is the quality of the code they contribute. Personal details of
+contributors are irrelevant. Contributor's opinions and comments on topics not
+directly related to the project being contributed to are also irrelevant.
+
+While we seek to be welcoming, it is important to recall that some amount of
+conflict is both unavoidable and healthy. Thus to attempt to avoid all conflict
+is both destructive and futile. Instead our goal is to encourage criticism and
+critique of code that is both respectful and civil with the express aim of
+improving the overall quality of the codebase, and also to prevent low quality
+contributions from being accepted into the codebase. Critique and criticism of
+a contributor's overall history of code quality in that contributor's
+contributions to the project must be allowed in a respectful and civil manner.
+
+To prevent abuse of it, we assert that the purpose of the Code of Conduct is to
+facilitate the creation of the best, most robust, software possible; not to
+control the thought or speech of contributors outside the bounds of the project.
+We respect the rights of contributors to do and say whatever they like when not
+directly representing the project.
 
 Our Standards
 =============
@@ -21,17 +36,19 @@ include:
 * Being respectful of differing viewpoints and experiences
 * Gracefully accepting constructive criticism
 * Focusing on what is best for the community
-* Showing empathy towards other community members
 
 
 Examples of unacceptable behavior by participants include:
 
-* The use of sexualized language or imagery and unwelcome sexual attention or
-  advances
+* The use of sexual imagery and sexual attention or advances
 * Trolling, insulting/derogatory comments, and personal or political attacks
 * Public or private harassment
 * Publishing others’ private information, such as a physical or electronic
   address, without explicit permission
+* Intentionally mentioning one's own irrelevant personal details and opinions
+* Not respecting the irrelevance of a contributor's personal details
+* Not respecting the irrelevance of a contributor's opinions outside the scope
+  of the project
 * Other conduct which could reasonably be considered inappropriate in a
   professional setting
 
@@ -40,35 +57,40 @@ Our Responsibilities
 ====================
 
 Maintainers are responsible for clarifying the standards of acceptable behavior
-and are expected to take appropriate and fair corrective action in response to
-any instances of unacceptable behavior.
+and are expected to take appropriate, consistent, and fair corrective action in
+response to any instances of unacceptable behavior.
 
-Maintainers have the right and responsibility to remove, edit, or reject
-comments, commits, code, wiki edits, issues, and other contributions that are
-not aligned to this Code of Conduct, or to ban temporarily or permanently any
-contributor for other behaviors that they deem inappropriate, threatening,
-offensive, or harmful.
+Maintainers have the right to remove, edit, or reject comments, commits, code,
+wiki edits, issues, and other contributions that are not aligned to this Code
+of Conduct, or to temporarily ban any contributor for behaviors that
+violate the Code of Conduct.
 
 Scope
 =====
 
 This Code of Conduct applies both within project spaces and in public spaces
-when an individual is representing the project or its community. Examples of
-representing a project or community include using an official project e-mail
-address, posting via an official social media account, or acting as an appointed
-representative at an online or offline event. Representation of a project may be
-further defined and clarified by project maintainers.
+when a contributor is explicitly representing the project or its community.
+Examples of representing the project or community include posting via an official
+social media account, or acting as an appointed representative at an online or
+offline event. Comments on personal social media accounts, emails, blogs and
+similar non-project related spaces are not subject to the Code of Conduct, and
+contributors may not be judged by them. An exception is made on a post-by-post
+basis (or equivalent thereof) when a contributor's post on any platform directly
+mentions trying to impact the project in any way. Representation of a project
+may be further defined and clarified by project maintainers.
 
 Enforcement
 ===========
 
-Instances of abusive, harassing, or otherwise unacceptable behavior may be
-reported by contacting the Technical Advisory Board (TAB) at
+Suspected violations of the code of conduct such as harassment may be reported
+by contacting the Technical Advisory Board (TAB) at
 <tab@lists.linux-foundation.org>. All complaints will be reviewed and
 investigated and will result in a response that is deemed necessary and
-appropriate to the circumstances. The TAB is obligated to maintain
-confidentiality with regard to the reporter of an incident.  Further details of
-specific enforcement policies may be posted separately.
+appropriate to the circumstances. The TAB is obligated to be as
+transparent as possible in this matter including publicly stating: who made the
+claim, when, why, who decided the claim, the reasoning used to decide on
+any leveled punishments, and providing some evidence of the violation. Further
+details of specific enforcement policies may be posted separately.
 
 Maintainers who do not follow or enforce the Code of Conduct in good faith may
 face temporary or permanent repercussions as determined by other members of the
@@ -77,5 +99,6 @@ project’s leadership.
 Attribution
 ===========
 
-This Code of Conduct is adapted from the Contributor Covenant, version 1.4,
-available at https://www.contributor-covenant.org/version/1/4/code-of-conduct.html
+This Code of Conduct is modified from the Contributor Covenant,
+version 1.4, available at:
+ https://www.contributor-covenant.org/version/1/4/code-of-conduct.html
\ No newline at end of file
-- 
2.19.0

