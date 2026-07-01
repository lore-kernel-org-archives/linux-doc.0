Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F29D345CDD;
	Wed,  1 Jul 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915570; cv=none; b=Gv+SlKhjHnosluohiz6cJjJCQ3pqJfShQU4seeSl2YMLGkYpGT4cYlhfLCewO4/kjPPVkKysRxVoJk+7pd95rp4yd54Me/ZXk3vf3JLl32DGX0cMyh9YwET0cyRH3T+EUJafBz9GqR+b9L9/RtXAj1yxx2b81rKnbz/L/wk4tyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915570; c=relaxed/simple;
	bh=9+HYGmt8p9z/cOCV3yvPP6iNpgqQ2mHe7LQosMp6vx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mcIOEmGieeikNShiqWVUhueECXlQV4+g/NLbnzGF3xiPZPR3n5WtkoDqIKe3WTJSpdnnjiNgin05Dodcn1cXgZhR2lN8GQxZyYWPJeh2rjDAI//vb7uT6XDgJVCIOH3eOREylHFX9aBSlcmfae76kX2qTqSHsqDzOMJoGJbGOGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dvUh5s2h; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dvUh5s2h"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIMWr494380;
	Wed, 1 Jul 2026 14:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=rZ/x02Kfe8IN8DMnT
	qHCjSrQq9ORDM5JzvReb8bUUzI=; b=dvUh5s2h0Fh/AOdae2JKWdunOk06tpXuz
	FtDiP2jkuFmhF//AL45h0Lv26EfSfTDKnG5pkWP3WIppWdy46eTpsklNeNxyklkQ
	gM7loKsRlJnKqlYZTd816KAuxFxmDxLXDd1tSS4KoGFJB1zAutJbw0SVIHylYlEl
	YQzYJPJUmis73sSCV3Jc+YHqlOfFI5wAI2G/ujYD8sgdFG2lyd6ZMEPr3XBRujfy
	M5EYaZHhog0FDSuOgXFykk+BlCrkZ0cwtwrfqZKVCc/147wJFXIBgvuRmtvias2n
	01OSKIB+ewoCSU9JvifSmobiAJnpVY8MQEJHx/qu0rA7BuEGHo9zQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26rf4h48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:19:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661E4bTa012712;
	Wed, 1 Jul 2026 14:19:09 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2ruqfu90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:19:09 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EJ5Ve16843226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:19:06 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7AE220049;
	Wed,  1 Jul 2026 14:19:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5EFF20040;
	Wed,  1 Jul 2026 14:18:52 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:18:52 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net
Cc: sshegde@linux.ibm.com, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org
Subject: [PATCH v6 08/23] sched/core: Keep tick on non-preferred CPUs until tasks are out
Date: Wed,  1 Jul 2026 19:46:39 +0530
Message-ID: <20260701141654.500125-9-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701141654.500125-1-sshegde@linux.ibm.com>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a4521df cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=QWx9vYyWXuU5Gb4Iy2kA:9
X-Proofpoint-ORIG-GUID: KsnwIWiTColC7iK_oLtqnKKgewv2uhX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfXzfXqdX7acTnb
 fcP+MF6hOlYkoFWKlYTWFtxeSNj56pgnKKWj6wQ/68mwbuVwkldiBqH94c4ZArBKIdlxY5SfINA
 zOOz94yERu6nn5bPG2cqEO24GUtCMsbu7J0DaxuhuqQ8tWKKWwgPDbLg8xupBhdsmcnZ+8UgTX/
 H9LPtjIqrMkWxK7/kG042MGK9BAxkDSl18ONU93ESWs+s/F1+w5YJlNMYqqzkG0al2/QEAn34/O
 vxSu5kxC9XsWYiYqxgNJXY1KSxcT61F2l4zpAz6XIS/E9xP/Yqs/S6qWgQ46gWpWiPwZ9MwtQpF
 cxiFm2BUM64eECQJ7gtt/hhHZrHAWCoJmhwWxQ7auNqDQjpZoVtw8yW4HSypzmE4HVp/q0WvsDe
 X3oKe08sjzrcBWuYGKZLgM22siQBKHfXVYN6WD0gU1yrRYm32FRT5rSJ7G5Ba2BbW+rCfxPJdFF
 B4kpPEi0FmerPWjWoZw==
X-Proofpoint-GUID: gvNwXb9LB1FGhnKhsxZ8w7vgavJb_mDo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX3uVdO4bAjfqY
 jrtZXXzyqCeCYt2015a9ICDwj0LckJoyMu7fa/AxUBGPrsk3MgwQnHUpgk8YZWs07ydCYu1fjYK
 TMUwJRjfGsVi86szEvMO6sluqJpkYBE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

Enable tick on nohz full CPU when it is marked as non-preferred.
If there in no FAIR task running there,disable the tick to
save the power.

Steal time handling code will call tick_nohz_dep_set_cpu with
TICK_DEP_BIT_SCHED for moving the task out of nohz_full CPU fast.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1fb1c17e8387..aa4201bb8082 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1473,6 +1473,10 @@ bool sched_can_stop_tick(struct rq *rq)
 			return false;
 	}
 
+	/* Keep the tick running until CFS tasks are pushed out*/
+	if (!cpu_preferred(rq->cpu) && rq->cfs.h_nr_queued)
+		return false;
+
 	return true;
 }
 #endif /* CONFIG_NO_HZ_FULL */
-- 
2.47.3

